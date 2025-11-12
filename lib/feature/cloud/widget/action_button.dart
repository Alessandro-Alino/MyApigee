import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapigee/feature/cloud/bloc/cloud_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({super.key, required this.file});

  final FileObject file;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: Colors.blueGrey,
      padding: EdgeInsets.zero,
      menuPadding: EdgeInsets.zero,
      icon: CircleAvatar(child: const Icon(Icons.more_vert)),
      offset: const Offset(-30, 35),
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      itemBuilder: (context) {
        return [
          // Download File with Progress
          PopupMenuItem(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            onTap: () {
              context.read<CloudCubit>().downloadFileWithProgress(file);
            },
            child: ListTile(
              leading: const Icon(Icons.download, color: Colors.white),
              title: const Text('Download'),
            ),
          ),
          // Delete File
          PopupMenuItem(
            padding: EdgeInsets.zero,
            onTap: () {
              context.read<CloudCubit>().deleteFile(file);
            },
            labelTextStyle: WidgetStateProperty.resolveWith((e) {
              return TextStyle(color: Colors.red, fontWeight: FontWeight.w600);
            }),
            child: Container(
              width: double.infinity,
              height: kMinInteractiveDimension,
              color: Colors.red.shade900.withAlpha(80),
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListTile(
                leading: const Icon(Icons.delete, color: Colors.red),
                title: const Text('Delete'),
              ),
            ),
          ),
        ];
      },
    );
  }
}
