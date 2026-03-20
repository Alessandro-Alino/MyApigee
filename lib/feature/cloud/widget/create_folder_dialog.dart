import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapigee/feature/cloud/bloc/cloud_cubit.dart';
import 'package:myapigee/widget/snackbar/app_snackbar.dart';
import 'package:myapigee/widget/snackbar/model/info_mex_model.dart';

class CreateFolderDialog extends StatefulWidget {
  const CreateFolderDialog({super.key});

  @override
  State<CreateFolderDialog> createState() => _CreateFolderDialogState();
}

class _CreateFolderDialogState extends State<CreateFolderDialog> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameFolderCntrl = TextEditingController();

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    _nameFolderCntrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Create Folder'),
      content: Form(
        key: _formKey,
        child: TextFormField(
          controller: _nameFolderCntrl,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Inserisci il nome della cartella';
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: 'Nome della cartella',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ),
      actions: [
        // Go Back
        TextButton(
          onPressed: () => context.router.pop(),
          child: const Text('Indietro'),
        ),
        // Create Folder
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              context.read<CloudCubit>().createFolder(_nameFolderCntrl.text);
              context.router.pop();
            } else {
              context.appSnackBar(
                infoMex: InfoMex(
                  mex: 'Inserisci il nome della cartella',
                  type: MexType.error,
                ),
              );
            }
          },
          child: const Text('Salva'),
        ),
      ],
    );
  }
}
