import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapigee/feature/create_api/bloc/create_api_cubit.dart';
import 'package:myapigee/feature/create_api/widget/create_api_textfield.dart';
import 'package:myapigee/widget/snackbar/app_snackbar.dart';

@RoutePage()
class CreateApiPage extends StatefulWidget {
  const CreateApiPage({super.key});

  @override
  State<CreateApiPage> createState() => _CreateApiPageState();
}

class _CreateApiPageState extends State<CreateApiPage> {
  final TextEditingController _createApiCntrl = TextEditingController();
  final TextEditingController _resultApiCntrl = TextEditingController();

  @override
  void dispose() {
    _createApiCntrl.dispose();
    _resultApiCntrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateApiCubit, CreateApiState>(
      listener: (context, state) {
        // InfoMex
        if (state.infoMex != null) {
          context.appSnackBar(infoMex: state.infoMex!);
        }
        // If result is not null, set the result to the textfield
        if (state.result != null) {
          _resultApiCntrl.text = state.result ?? '';
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 8.0,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TextField for API
              const Text('Insert the List of API'),
              Expanded(
                flex: 1,
                child: CreateApiTextfield(controller: _createApiCntrl),
              ),
              // Button for Create API
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(
                    child: ActionChip(
                      onPressed: () {
                        context.read<CreateApiCubit>().extractEndpoint(
                          _createApiCntrl.text,
                        );
                      },
                      label: const Text('Create API'),
                    ),
                  ),
                ],
              ),
              // TextField for Result API
              const Text('Result:'),
              Expanded(
                flex: 2,
                child: CreateApiTextfield(controller: _resultApiCntrl),
              ),
            ],
          ),
        );
      },
    );
  }
}
