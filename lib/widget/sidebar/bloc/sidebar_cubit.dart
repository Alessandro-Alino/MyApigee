import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapigee/widget/sidebar/repo/app_sidebar_service.dart';

class SidebarCubit extends Cubit<bool> {
  SidebarCubit() : super(true) {
    getStatusSidebar();
  }

  // Use the singleton instance of AppSidebarService
  final AppSidebarService _sidebarService = AppSidebarService();

  // Save Status Sidebar
  Future<void> saveStatusSidebar(bool value) async {
    await _sidebarService.saveStatusSidebar(value);
    getStatusSidebar();
  }

  // Get Status Sidebar
  void getStatusSidebar() {
    final bool? result = _sidebarService.getStatusSidebar();
    if (result != null) {
      emit(result);
    } else {
      emit(true);
    }
  }
}
