import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapigee/feature/cloud/bloc/cloud_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PercentageLoading extends StatelessWidget {
  const PercentageLoading({super.key, required this.file});

  final FileObject file;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: BlocBuilder<CloudCubit, CloudState>(
        builder: (context, state) {
          return state.isNetworking && file.id == state.networkingFileId
              ? Stack(
                  alignment: Alignment.center,
                  children: [
                    // Percentage
                    Text(
                      '${(state.networkinProgress * 100).toStringAsFixed(0)} %',
                    ),
                    // Circular
                    CircularProgressIndicator.adaptive(
                      value: state.networkinProgress,
                      // color of value
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.deepPurple,
                      ),
                    ),
                  ],
                )
              : const SizedBox.shrink();
        },
      ),
    );
  }
}
