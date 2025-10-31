import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapigee/config/extension/extensions.dart';
import 'package:myapigee/feature/cloud/bloc/cloud_cubit.dart';
import 'package:myapigee/feature/cloud/widget/delete_file_alert.dart';
import 'package:myapigee/feature/cloud/widget/percentage_loading.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CloudFileList extends StatelessWidget {
  const CloudFileList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CloudCubit, CloudState>(
      builder: (context, state) {
        return ListView.builder(
          padding: const EdgeInsets.only(bottom: 80.0),
          itemCount: state.files.length,
          itemBuilder: (context, index) {
            final FileObject file = state.files[index];
            final int size = file.metadata?['size'];
            return Center(
              child: Container(
                constraints: BoxConstraints(maxWidth: 800.0),
                child: Card(
                  child: ListTile(
                    title: Text(file.name, overflow: TextOverflow.ellipsis),
                    subtitle: Text('${size.formatFileSize()}'),
                    trailing: Row(
                      spacing: 8.0,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Loading Progress if download
                        PercentageLoading(file: file),
                        // Download Button
                        IconButton.filledTonal(
                          onPressed: () {
                            // If not downloading another file
                            if (!state.isNetworking) {
                              // Is WEB
                              if (kIsWeb) {
                                context.read<CloudCubit>().downloadFile(file);
                              }
                              // Is Platform (Android, iOS, Linux, Windows, Mac)
                              else {
                                context
                                    .read<CloudCubit>()
                                    .downloadFileWithProgress(file);
                              }
                            }
                          },
                          icon: Icon(Icons.download),
                        ),
                        // Delete Button
                        IconButton.filledTonal(
                          onPressed: () {
                            // Show Delete Alert
                            showAdaptiveDialog(
                              context: context,
                              builder: (context) {
                                return DeleteFileAlert(file: file);
                              },
                            );
                          },
                          icon: Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
