import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapigee/feature/cloud/bloc/cloud_cubit.dart';
import 'package:myapigee/feature/cloud/widget/cloud_file_list.dart';
import 'package:myapigee/feature/cloud/widget/cloud_top_bar.dart';
import 'package:myapigee/feature/cloud/widget/cloud_upload_bottom_bar.dart';
import 'package:myapigee/widget/snackbar/app_snackbar.dart';

@RoutePage()
class CloudPage extends StatelessWidget {
  const CloudPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          // TopBar
          CloudTopBar(),
          // File List
          BlocListener<CloudCubit, CloudState>(
            listener: (context, state) {
              // InfoMex
              if (state.infoMex != null) {
                context.appSnackBar(infoMex: state.infoMex!);
              }
            },
            child: Expanded(child: CloudFileList()),
          ),
        ],
      ),

      floatingActionButton: CloudUploadBottomBar(),
    );
  }
}
