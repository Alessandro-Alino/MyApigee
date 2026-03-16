import 'package:auto_route/auto_route.dart';
import 'package:myapigee/config/route/app_route.gr.dart';
import 'package:myapigee/config/route/app_route_const.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
    // Home Page
    AutoRoute(
      path: AppRouteConst.homePage,
      page: HomeRoute.page,
      initial: true,
      children: [
        // Parser XML Page
        CustomRoute(
          initial: true,
          path: AppRouteConst.parserXmlPage,
          page: ParserXmlRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        // Create Proxy Page
        CustomRoute(
          path: AppRouteConst.createProxyPage,
          page: CreateProxyRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        // Create API Page
        CustomRoute(
          path: AppRouteConst.createApiPage,
          page: CreateApiRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        // Cloud Page
        CustomRoute(
          path: AppRouteConst.cloudPage,
          page: CloudRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          children: [
            // Create Folder
            AutoRoute(
              path: AppRouteConst.cloudCreateFolderPage,
              page: CreateFolderRoute.page,
            ),
          ]
        ),
      ],
    ),
  ];

  @override
  List<AutoRouteGuard> get guards => [
    // optionally add root guards here
  ];
}
