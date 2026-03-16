// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:myapigee/feature/cloud/screen/cloud_page.dart' as _i1;
import 'package:myapigee/feature/cloud/screen/create_folder.dart' as _i3;
import 'package:myapigee/feature/create_api/screen/create_api_page.dart' as _i2;
import 'package:myapigee/feature/create_proxy/screen/create_proxy_page.dart'
    as _i4;
import 'package:myapigee/feature/parser_xml/screen/parser_xml_page.dart' as _i6;
import 'package:myapigee/screen/home_page.dart' as _i5;

/// generated route for
/// [_i1.CloudPage]
class CloudRoute extends _i7.PageRouteInfo<void> {
  const CloudRoute({List<_i7.PageRouteInfo>? children})
    : super(CloudRoute.name, initialChildren: children);

  static const String name = 'CloudRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i1.CloudPage();
    },
  );
}

/// generated route for
/// [_i2.CreateApiPage]
class CreateApiRoute extends _i7.PageRouteInfo<void> {
  const CreateApiRoute({List<_i7.PageRouteInfo>? children})
    : super(CreateApiRoute.name, initialChildren: children);

  static const String name = 'CreateApiRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i2.CreateApiPage();
    },
  );
}

/// generated route for
/// [_i3.CreateFolderPage]
class CreateFolderRoute extends _i7.PageRouteInfo<void> {
  const CreateFolderRoute({List<_i7.PageRouteInfo>? children})
    : super(CreateFolderRoute.name, initialChildren: children);

  static const String name = 'CreateFolderRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i3.CreateFolderPage();
    },
  );
}

/// generated route for
/// [_i4.CreateProxyPage]
class CreateProxyRoute extends _i7.PageRouteInfo<void> {
  const CreateProxyRoute({List<_i7.PageRouteInfo>? children})
    : super(CreateProxyRoute.name, initialChildren: children);

  static const String name = 'CreateProxyRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i4.CreateProxyPage();
    },
  );
}

/// generated route for
/// [_i5.HomePage]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute({List<_i7.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i5.HomePage();
    },
  );
}

/// generated route for
/// [_i6.ParserXmlPage]
class ParserXmlRoute extends _i7.PageRouteInfo<void> {
  const ParserXmlRoute({List<_i7.PageRouteInfo>? children})
    : super(ParserXmlRoute.name, initialChildren: children);

  static const String name = 'ParserXmlRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i6.ParserXmlPage();
    },
  );
}
