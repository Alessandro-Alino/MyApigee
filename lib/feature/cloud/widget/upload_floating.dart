import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapigee/config/extension/extensions.dart';
import 'package:myapigee/feature/cloud/bloc/cloud_cubit.dart';
import 'package:myapigee/feature/cloud/model/file_upload_model.dart';
import 'package:myapigee/widget/app_loading.dart';

import '../../../widget/snackbar/app_snackbar.dart';

class UploadFloating extends StatefulWidget {
  const UploadFloating({super.key});

  @override
  State<UploadFloating> createState() => _UploadFloatingState();
}

class _UploadFloatingState extends State<UploadFloating> {
  final ValueNotifier<bool> _isExtended = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _isExtended.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 32.0, right: 0.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ValueListenableBuilder<bool>(
            valueListenable: _isExtended,
            builder: (context, isExtended, child) {
              return AnimatedContainer(
                curve: Curves.easeInOut,
                duration: const Duration(milliseconds: 300),
                height: isExtended ? 500.0 : 60.0,
                width: isExtended ? constraints.maxWidth * 0.8 : 80.0,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade700,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: isExtended
                    // Extended Upload
                    ? ExtendedUpload(
                        onPressed: () {
                          _isExtended.value = false;
                        },
                      )
                    // Classic Floating Button
                    : InkWell(
                        onTap: () {
                          _isExtended.value = true;
                        },
                        child: Center(child: Text(context.ltr.upload)),
                      ),
              );
            },
          );
        },
      ),
    );
  }
}

class ExtendedUpload extends StatelessWidget {
  const ExtendedUpload({
    super.key,
    required this.onPressed,
  });


  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(milliseconds: 300), () => true),
      builder: (context, asyncSnapshot) {
        return AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: asyncSnapshot.connectionState == ConnectionState.done
              ? 1.0
              : 0.0,
          child: BlocConsumer<CloudCubit, CloudState>(
            listener: (context, state) {
              // InfoMex
              if (state.infoMex != null) {
                context.appSnackBar(infoMex: state.infoMex!);
              }
            },
            builder: (context, state) {
              return Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  elevation: 0.0,
                  scrolledUnderElevation: 0.0,
                  backgroundColor: Colors.transparent,
                  automaticallyImplyLeading: false,
                  title: Text('Lista File da caricare'),
                  actionsPadding: const EdgeInsets.only(right: 8.0),
                  actions: [
                    ActionChip(
                      avatar: const Icon(Icons.add),
                      label: Text(context.ltr.select),
                      onPressed: () =>
                          context.read<CloudCubit>().selectFileUpload(),
                    ),
                    const SizedBox(width: 8.0),
                    IconButton.filledTonal(
                      padding: EdgeInsets.zero,
                      visualDensity: VisualDensity.compact,
                      constraints: const BoxConstraints(
                        minWidth: 40.0,
                        minHeight: 40.0,
                      ),
                      onPressed: onPressed,
                      icon: const Icon(
                        Icons.keyboard_arrow_down_outlined,
                        size: 18.0,
                      ),
                    ),
                  ],
                ),
                body: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Divider(),
                    // List of files
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.only(bottom: 80.0),
                        itemCount: state.fileUploads.length,
                        itemBuilder: (context, index) {
                          final FileUploadModel fileUploadModel =
                              state.fileUploads[index];
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 8.0,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                spacing: 8.0,
                                children: [
                                  const Icon(
                                    Icons.insert_drive_file,
                                    size: 20,
                                  ),
                                  Expanded(
                                    child: Text(
                                      fileUploadModel.fileName,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  // Status Upload
                                  SizedBox.square(
                                    dimension: 24.0,
                                    child: Center(
                                      child: switch (fileUploadModel
                                          .fileUploadStatus) {
                                        FileUploadStatus.init =>
                                          const SizedBox.shrink(),
                                        FileUploadStatus.loading =>
                                          const AppLoading(),
                                        FileUploadStatus.success =>
                                          const Icon(
                                            Icons.check,
                                            color: Colors.green,
                                          ),
                                        FileUploadStatus.error => const Icon(
                                          Icons.error,
                                          color: Colors.red,
                                        ),
                                      },
                                    ),
                                  ),
                                  // Remove file from list of Upload file
                                  IconButton.filledTonal(
                                    padding: EdgeInsets.zero,
                                    constraints: const BoxConstraints(
                                      minWidth: 8.0,
                                      minHeight: 8.0,
                                    ),
                                    onPressed: () => context
                                        .read<CloudCubit>()
                                        .deselectFileUpload(fileUploadModel),
                                    icon: const Icon(Icons.remove, size: 18),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                floatingActionButton: FloatingActionButton.extended(
                  icon: const Icon(Icons.upload),
                  label: const Text('Upload'),
                  onPressed: () => context.read<CloudCubit>().uploadFiles(),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
