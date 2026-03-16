import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:myapigee/config/extension/extensions.dart';
import 'package:myapigee/widget/sidebar/sidebar.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      appBar: AppBar(
        title: Text(context.ltr.home),
        backgroundColor: Colors.blueGrey.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade900,
              borderRadius: BorderRadius.circular(16.0),
            ),
            constraints: BoxConstraints(maxWidth: 2000.0),
            child: Row(
              children: [
                // SideBar
                SideBar(),
                // Pages
                Expanded(
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    margin: const EdgeInsets.only(left: 8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: AutoRouter(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
