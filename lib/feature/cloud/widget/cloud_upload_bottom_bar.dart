import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapigee/feature/cloud/bloc/cloud_cubit.dart';
import 'package:myapigee/widget/app_loading.dart';

class CloudUploadBottomBar extends StatelessWidget {
  const CloudUploadBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CloudCubit, CloudState>(
      builder: (context, state) {
        return state.selectedFileUpload == null
            ? FloatingActionButton.extended(
                onPressed: () {
                  context.read<CloudCubit>().selectFileUpload();
                },
                label: const Text('Upload'),
                icon: const Icon(Icons.upload),
              )
            : Row(
                children: [
                  const SizedBox(width: 28.0),
                  Expanded(
                    child: FloatingActionButton(
                      onPressed: null,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          spacing: 8.0,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // File selected Name
                            Expanded(
                              child: Text(
                                '${state.selectedFileUploadName}',
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            // Upload File Button & Remove File Button
                            Flexible(
                              child: Row(
                                spacing: 8.0,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: state.isNetworking
                                    ? [
                                        SizedBox.square(
                                          dimension: 32.0,
                                          child: CircleAvatar(
                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                8.0,
                                              ),
                                              child: const AppLoading(),
                                            ),
                                          ),
                                        ),
                                      ]
                                    : [
                                        // Upload File Button
                                        Flexible(
                                          child: IconButton.filledTonal(
                                            onPressed: () {
                                              context
                                                  .read<CloudCubit>()
                                                  .uploadFile();
                                            },
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  WidgetStateProperty.all(
                                                    Colors.green.shade700,
                                                  ),
                                            ),
                                            icon: Icon(Icons.upload),
                                          ),
                                        ),
                                        // Remove File Button
                                        Flexible(
                                          child: IconButton.filledTonal(
                                            onPressed: () {
                                              context
                                                  .read<CloudCubit>()
                                                  .deselectFileUpload();
                                            },
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  WidgetStateProperty.all(
                                                    Colors.red.shade700,
                                                  ),
                                            ),
                                            icon: Icon(Icons.close),
                                          ),
                                        ),
                                      ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
      },
    );
  }
}
