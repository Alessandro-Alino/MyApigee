import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapigee/feature/cloud/bloc/cloud_cubit.dart';
import 'package:myapigee/widget/app_loading.dart';

class CloudTopBar extends StatelessWidget {
  const CloudTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade700,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        children: [
          // Reload File
          TextButton(
            onPressed: () {
              context.read<CloudCubit>().loadFiles();
            },
            child: const Text('Refresh'),
          ),
          const Spacer(),
          // Loading
          BlocBuilder<CloudCubit, CloudState>(
            builder: (context, state) {
              return SizedBox(
                child: state.status == CloudStatus.loading
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: SizedBox.square(
                          dimension: 32.0,
                          child: CircleAvatar(child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: const AppLoading(),
                          )),
                        ),
                      )
                    : const SizedBox.shrink(),
              );
            },
          ),
        ],
      ),
    );
  }
}
