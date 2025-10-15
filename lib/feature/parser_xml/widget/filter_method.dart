import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapigee/feature/parser_xml/bloc/parser_xml_cubit.dart';
import 'package:myapigee/feature/parser_xml/model/api_model.dart';

class FilterMethod extends StatelessWidget {
  const FilterMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 69.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          // List Method
          Expanded(
            child: BlocBuilder<ParserXmlCubit, ParserXmlState>(
              builder: (context, state) {
                // If no API, return Container early
                if (state.apiModels == null) {
                  return const SizedBox.shrink();
                }

                // Count API by Method
                final methodCounts = {
                  for (final method in Method.values)
                    method: state.apiModels!.where((e) => e.method == method).length
                };

                // Order Method by count API
                final sortedMethods = Method.values.toList()
                  ..sort((a, b) {
                    final aHasApi = methodCounts[a]! > 0;
                    final bHasApi = methodCounts[b]! > 0;

                    // Case 1: Both have APIs or both don't have APIs
                    if (aHasApi == bHasApi) {
                      return 0; // Maintain original order
                    }
                    // Case 2: One has an API, the other doesn't
                    return aHasApi ? -1 : 1;
                  });

                // Return ListView of Method
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: Method.values.length,
                  itemBuilder: (context, index) {
                    final Method method = sortedMethods[index];
                    // Count API by Method
                    int apiByMethod = state.apiModels!
                        .where((e) => e.method == method)
                        .length;

                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ActionChip(
                        label: Text(
                          '${method.name.toUpperCase()} - $apiByMethod',
                        ),
                        onPressed: apiByMethod == 0
                            ? null
                            : () {
                                // Filter API by Method
                                context.read<ParserXmlCubit>().filterByMethod(
                                  method,
                                );
                              },
                        side: BorderSide(color: method.color.withAlpha(150)),
                        color: WidgetStatePropertyAll(
                          method.color.withAlpha(100),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          // Reset Filter
          IconButton(
            onPressed: () {
              // Filter API by Method
              context.read<ParserXmlCubit>().filterByMethod(null, reset: true);
            },
            icon: Icon(Icons.refresh_rounded),
          ),
          // IconButton Action
          PopupMenuButton(
            offset: Offset(-20, 40),
            color: Colors.blueGrey.shade900,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey.withAlpha(150), width: 0.8),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(4.0),
                bottomLeft: Radius.circular(16.0),
                bottomRight: Radius.circular(16.0),
              ),
            ),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: SwitchListTile(
                    value: false,
                    contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    title: Text('Hide empty Methods'),
                    onChanged: (value) {},
                  ),
                ),
              ];
            },
          ),
        ],
      ),
    );
  }
}
