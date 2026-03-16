import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapigee/config/extension/extensions.dart';
import 'package:myapigee/feature/cloud/bloc/cloud_cubit.dart';
import 'package:myapigee/feature/cloud/utils/cloud_item.dart';
import 'package:myapigee/feature/cloud/widget/action_button.dart';
import 'package:myapigee/feature/cloud/widget/breadcrumb.dart';
import 'package:myapigee/feature/cloud/widget/percentage_loading.dart';

class CloudFileList extends StatelessWidget {
  const CloudFileList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CloudCubit, CloudState>(
      builder: (context, state) {
        return Column(
          children: [
            // Breadcrumb
            Breadcrumb(),
            // List
            Expanded(
              child: state.files.isEmpty
                  ? const Center(child: Text('Nessun file trovato'))
                  : ListView.builder(
                      padding: const EdgeInsets.only(bottom: 80.0),
                      itemCount: state.files.length,
                      itemBuilder: (context, index) {
                        final CloudItem cloudItem = state.files[index];
                        return Card(
                          clipBehavior: Clip.hardEdge,
                          child: ListTile(
                            onTap: () {
                              if (cloudItem.isFolder) {
                                // Navigate to folder
                                context.read<CloudCubit>().loadFiles(
                                  path: cloudItem.file.name,
                                );
                              }
                            },
                            leading: Icon(
                              cloudItem.isFolder
                                  ? Icons.folder
                                  : Icons.file_copy,
                            ),
                            title: Text(
                              cloudItem.file.name,
                              overflow: TextOverflow.ellipsis,
                            ),
                            subtitle: cloudItem.isFolder
                                ? null
                                : Text(cloudItem.size.formatFileSize()),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Loading Progress if download
                                PercentageLoading(file: cloudItem.file),
                                // Action Button
                                ActionButton(file: cloudItem.file),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        );
      },
    );
  }
}
