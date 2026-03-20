import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapigee/config/extension/extensions.dart';
import 'package:myapigee/feature/cloud/bloc/cloud_cubit.dart';
import 'package:myapigee/feature/cloud/widget/create_folder_dialog.dart';
import 'package:myapigee/widget/app_loading.dart';

class CloudTopBar extends StatelessWidget {
  const CloudTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      padding: const EdgeInsets.all(8.0),
      height: 60.0,
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade700,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        spacing: 16.0,
        children: [
          // Action Button
          Expanded(
            child: Row(
              spacing: 8.0,
              children: [
                // Create Folder
                Flexible(
                  child: ActionChip(
                    avatar: const Icon(Icons.create_new_folder),
                    label: Text(context.ltr.create_folder),
                    onPressed: () {
                      // Show Dialog for Create Folder
                      showDialog(
                        context: context,
                        builder: (context) {
                          return CreateFolderDialog();
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const VerticalDivider(width: 8.0),
          // Icon Check
          BlocBuilder<CloudCubit, CloudState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: SizedBox.square(
                  dimension: 32.0,
                  child: switch (state.status) {
                    CloudStatus.loading => const AppLoading(),
                    CloudStatus.success => Tooltip(
                      decoration: BoxDecoration(
                        color: Colors.green.shade700,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      message: 'All good 👍',
                      textStyle: Theme.of(context).textTheme.bodyMedium
                          ?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                      child: Icon(
                        Icons.check_circle_rounded,
                        color: Colors.green.shade700,
                      ),
                    ),
                    _ => Tooltip(
                      decoration: BoxDecoration(
                        color: Colors.amber.shade600,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      textStyle: Theme.of(context).textTheme.bodyMedium
                          ?.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                      message: 'Server error.',
                      child: Icon(Icons.error, color: Colors.amber.shade700),
                    ),
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
