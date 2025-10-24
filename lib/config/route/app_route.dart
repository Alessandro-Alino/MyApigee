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
        AutoRoute(
          initial: true,
          path: AppRouteConst.parserXmlPage,
          page: ParserXmlRoute.page,
        ),
        // Create API Page
        AutoRoute(
          path: AppRouteConst.createApiPage,
          page: CreateApiRoute.page,
        ),
        // Cloud Page
        AutoRoute(
          path: AppRouteConst.cloudPage,
          page: CloudRoute.page,
        ),
      ],
    ),
  ];

  @override
  List<AutoRouteGuard> get guards => [
    // optionally add root guards here
  ];
}
