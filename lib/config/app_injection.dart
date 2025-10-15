import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapigee/config/theme/bloc/app_theme_cubit.dart';
import 'package:myapigee/config/theme/repo/app_theme_service.dart';
import 'package:myapigee/feature/parser_xml/bloc/parser_xml_cubit.dart';
import 'package:myapigee/widget/sidebar/bloc/sidebar_cubit.dart';
import 'package:myapigee/widget/sidebar/repo/app_sidebar_service.dart';

class AppInjection extends StatelessWidget {
  const AppInjection({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        // App Shared Prefs
        RepositoryProvider<AppThemeService>(
          create: (context) => AppThemeService(),
        ),
        // App SideBar Service
        RepositoryProvider<AppSidebarService>(
          create: (context) => AppSidebarService(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          // Theme Cubit
          BlocProvider<AppThemeCubit>(
            create: (context) =>
                AppThemeCubit(appThemeService: context.read<AppThemeService>())
                  ..getTheme(context),
          ),
          // Sidebar Cubit
          BlocProvider<SidebarCubit>(create: (context) => SidebarCubit()),
          // ParsedXml Cubit
          BlocProvider<ParserXmlCubit>(create: (context) => ParserXmlCubit()),
        ],
        child: child,
      ),
    );
  }
}
