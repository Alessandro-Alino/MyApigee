import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapigee/config/route/app_route_const.dart';
import 'package:myapigee/widget/sidebar/bloc/sidebar_cubit.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SidebarCubit, bool>(
      builder: (context, state) {
        return AnimatedContainer(
          width: state ? 250.0 : 70.0,
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 500),
          decoration: BoxDecoration(
            color: Colors.blueGrey.shade700,
            borderRadius: BorderRadius.circular(16.0),
          ),
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // Button Open / Close the SideBar.
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: state
                          ? AnimatedRotation(
                              turns: 0.5,
                              curve: Curves.easeInOut,
                              duration: Durations.medium4,
                              child: IconButton.filledTonal(
                                onPressed: () {
                                  context
                                      .read<SidebarCubit>()
                                      .saveStatusSidebar(!state);
                                },
                                icon: Icon(Icons.arrow_forward_rounded),
                              ),
                            )
                          : AnimatedRotation(
                              turns: 0.0,
                              curve: Curves.easeInOut,
                              duration: Durations.medium4,
                              child: IconButton.filledTonal(
                                onPressed: () {
                                  context
                                      .read<SidebarCubit>()
                                      .saveStatusSidebar(!state);
                                },
                                icon: Icon(Icons.arrow_forward_rounded),
                              ),
                            ),
                    ),
                  ),
                ],
              ),
              // Parser XML
              PageTile(
                iconData: Icons.document_scanner_outlined,
                title: 'Parser XML',
                isExpanded: state,
                onTap: () =>
                    context.router.pushPath(AppRouteConst.parserXmlPage),
              ),
              // Create API
              PageTile(
                iconData: Icons.api_rounded,
                title: 'Create API',
                isExpanded: state,
                onTap: () =>
                    context.router.pushPath(AppRouteConst.createApiPage),
              ),
              // Cloud
              PageTile(
                iconData: Icons.cloud_queue_rounded,
                title: 'Cloud',
                isExpanded: state,
                onTap: () => context.router.pushPath(AppRouteConst.cloudPage),
              ),
            ],
          ),
        );
      },
    );
  }
}

class PageTile extends StatelessWidget {
  const PageTile({
    super.key,
    required this.iconData,
    required this.title,
    required this.isExpanded,
    required this.onTap,
  });

  final IconData iconData;
  final String title;
  final bool isExpanded;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        // Function
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              // Icon
              Flexible(
                child: SizedBox(width: 30.0, child: Icon(iconData, size: 30.0)),
              ),
              // Text
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    title,
                    softWrap: false,
                    style: TextStyle(overflow: TextOverflow.fade),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
