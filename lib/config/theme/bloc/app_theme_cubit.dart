import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapigee/config/theme/repo/app_theme_service.dart';

class AppThemeCubit extends Cubit<ThemeMode> {
  AppThemeCubit({required this.appThemeService}) : super(ThemeMode.system);

  final AppThemeService appThemeService;

  // Set Theme
  Future<void> setTheme(ThemeMode mode) async {
    await appThemeService.saveTheme(mode.name);
    emit(mode);
  }

  // Get Theme
  void getTheme(BuildContext context) {
    final themeString = appThemeService.getTheme();

    final theme = switch (themeString) {
      'light' => ThemeMode.light,
      'dark' => ThemeMode.dark,
      _ => ThemeMode.dark,
    };

    emit(theme);
  }
}
