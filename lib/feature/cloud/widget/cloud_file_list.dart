import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapigee/config/extension/extensions.dart';
import 'package:myapigee/feature/cloud/bloc/cloud_cubit.dart';
import 'package:myapigee/feature/cloud/widget/action_button.dart';
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
            return Card(
              child: ListTile(
                title: Text(file.name, overflow: TextOverflow.ellipsis),
                subtitle: Text('${size.formatFileSize()}'),
                trailing: Row(
                  spacing: 8.0,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Loading Progress if download
                    PercentageLoading(file: file),
                    // Action Button
                    ActionButton(file: file),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
