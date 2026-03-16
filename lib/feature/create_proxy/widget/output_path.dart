import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapigee/config/extension/extensions.dart';
import 'package:myapigee/feature/create_proxy/bloc/create_proxy_cubit.dart';

import '../../../widget/snackbar/app_snackbar.dart';

class OutputPath extends StatefulWidget {
  const OutputPath({super.key});

  @override
  State<OutputPath> createState() => _OutputPathState();
}

class _OutputPathState extends State<OutputPath> {
  final TextEditingController _outputPathCntrl = TextEditingController();

  @override
  void initState() {
    context.read<CreateProxyCubit>().getOutputPath();
    _outputPathCntrl.text = context.read<CreateProxyCubit>().state.outputPath;
    super.initState();
  }

  @override
  void dispose() {
    _outputPathCntrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateProxyCubit, CreateProxyState>(
      listener: (context, state) {
        // InfoMex
        if (state.infoMex != null && state.outputPath.isEmpty) {
          context.appSnackBar(infoMex: state.infoMex!);
        }
        // Update the TextFormField when Path is selected
        if (state.outputPath.isNotEmpty) {
          _outputPathCntrl.text = state.outputPath;
        } else {
          _outputPathCntrl.text = '';
        }
      },
      builder: (context, state) {
        return Container(
          height: 64.0,
          margin: const EdgeInsets.only(top: 8.0),
          child: Row(
            spacing: 8.0,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: TextFormField(
                    readOnly: true,
                    enabled: state.outputPath.isNotEmpty,
                    controller: _outputPathCntrl,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: ' ',
                      errorText: state.outputPath.isEmpty
                          ? 'Seleziona una percorso'
                          : null,
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                      isDense: true,
                      labelText: context.ltr.directory,
                      suffixIcon: state.outputPath.isEmpty
                          ? null
                          : Icon(
                              Icons.check_circle_rounded,
                              color: Colors.green,
                            ),
                    ),
                  ),
                ),
              ),
              // Select path
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: ActionChip(
                  avatar: const Icon(Icons.folder),
                  label: Text('Seleziona'),
                  onPressed: () {
                    context.read<CreateProxyCubit>().chooseOutputPath();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
