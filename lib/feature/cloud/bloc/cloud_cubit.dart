import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cloud_state.dart';

part 'cloud_cubit.freezed.dart';

class CloudCubit extends Cubit<CloudState> {
  CloudCubit() : super(CloudState.initState());

  //final CloudRepo cloudRepo = CloudRepo(supabase: supabase, bucketName: bucketName);

  // Error Message
  void errorMex(String error) {
    emit(state.copyWith(errorMex: '[CLOUD_BLOC] $error'));
    Future.delayed(const Duration(seconds: 2), () {
      emit(state.copyWith(errorMex: null));
    });
  }

  // Init
  void init() {
    emit(CloudState.initState());
  }
}
