import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapigee/feature/cloud/bloc/cloud_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DeleteFileAlert extends StatelessWidget {
  const DeleteFileAlert({super.key, required this.file});

  final FileObject file;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Eliminare il file?'),
      content: const Text('Sei sicuro di voler eliminare il file?'),
      actions: [
        // Go Back
        TextButton(
          onPressed: () {
            context.router.pop();
          },
          child: const Text('No'),
        ),
        // Delete Button
        TextButton(
          onPressed: () {
            context.read<CloudCubit>().deleteFile(file);
            context.router.pop();
          },
          child: const Text('Yes, delete'),
        ),
      ],
    );
  }
}
