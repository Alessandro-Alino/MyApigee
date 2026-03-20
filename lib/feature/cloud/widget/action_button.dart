import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapigee/feature/cloud/bloc/cloud_cubit.dart';
import 'package:myapigee/feature/cloud/utils/cloud_item.dart';
import 'package:myapigee/widget/snackbar/app_snackbar.dart';
import 'package:myapigee/widget/snackbar/model/info_mex_model.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({super.key, required this.cloudItem});

  final CloudItem cloudItem;

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
          // Download
          !kIsWeb ?
          PopupMenuItem(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            onTap: () {
              if (!kIsWeb) {
                context.read<CloudCubit>().downloadFileWithProgress(cloudItem.file);
              } else {
                context.appSnackBar(
                  infoMex: InfoMex(mex: 'Not from Web', type: MexType.warning),
                );
              }
            },
            child: ListTile(
              leading: const Icon(Icons.download, color: Colors.white),
              title: const Text('Download'),
            ),
          ) :
          // Download File from Web
          PopupMenuItem(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            onTap: () {
              if (kIsWeb) {
                context.read<CloudCubit>().downloadFileFromWeb(cloudItem.file);
              } else {
                context.appSnackBar(
                  infoMex: InfoMex(mex: 'Only from Web', type: MexType.warning),
                );
              }
            },
            child: ListTile(
              leading: const Icon(
                Icons.laptop_chromebook_rounded,
                color: Colors.white,
              ),
              title: const Text('Download Web'),
            ),
          ),
          // Delete File
          PopupMenuItem(
            padding: EdgeInsets.zero,
            onTap: () {
              if (cloudItem.isFolder) {
                log('Delete folder');
                context.read<CloudCubit>().deleteFolder(cloudItem.file.name);
              } else {
                log('Delete file');
                context.read<CloudCubit>().deleteFile(cloudItem.file);
              }
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
