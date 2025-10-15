import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapigee/config/app_injection.dart';
import 'package:myapigee/config/l10n/generated/app_localizations.dart';
import 'package:myapigee/config/l10n/local.dart';
import 'package:myapigee/config/route/app_route.dart';
import 'package:myapigee/config/shared_prefs/app_shared_prefs.dart';
import 'package:myapigee/config/theme/app_theme.dart';
import 'package:myapigee/config/theme/bloc/app_theme_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppSharedPrefs().init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // App Router
    final appRouter = AppRouter();

    return AppInjection(
      child: BlocBuilder<AppThemeCubit, ThemeMode>(
        builder: (context, state) {
          return MaterialApp.router(
            themeMode: state,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            scrollBehavior: const MaterialScrollBehavior().copyWith(
              dragDevices: {
                PointerDeviceKind.touch,
                PointerDeviceKind.mouse,
                PointerDeviceKind.trackpad,
                PointerDeviceKind.stylus,
              },
            ),
            routerConfig: appRouter.config(),
            onGenerateTitle: (context) => context.ltr.title_app,
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
          );
        },
      ),
    );
  }
}
