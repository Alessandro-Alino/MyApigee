import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:myapigee/config/route/app_route_const.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Drawer Header
          DrawerHeader(
            child: IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
          ),
          // Drawer Items
          // Parser XML
          ActionChip(
            label: Text('Parser XML'),
            onPressed: () =>
                context.router.pushPath(AppRouteConst.parserXmlPage),
          ),
          // Create API
          ActionChip(
            label: Text('Create API'),
            onPressed: () =>
                context.router.pushPath(AppRouteConst.createApiPage),
          ),
          // Cloud
          ActionChip(
            label: Text('Cloud'),
            onPressed: () => context.router.pushPath(AppRouteConst.cloudPage),
          ),
        ],
      ),
    );
  }
}
