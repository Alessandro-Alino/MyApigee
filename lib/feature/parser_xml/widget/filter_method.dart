import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapigee/feature/parser_xml/bloc/parser_xml_cubit.dart';
import 'package:myapigee/feature/parser_xml/model/api_model.dart';

class FilterMethod extends StatelessWidget {
  const FilterMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 69.0,
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          // List Method
          Expanded(
            child: BlocBuilder<ParserXmlCubit, ParserXmlState>(
              builder: (context, state) {
                // If no API, return Container early
                if (state.apiModels.isEmpty) {
                  return const SizedBox.shrink();
                }

                // Count API by Method
                final methodCounts = {
                  for (final method in Method.values)
                    method: state.apiModels
                        .where((e) => e.method == method)
                        .length,
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
                    int apiByMethod = state.apiModels
                        .where((e) => e.method == method)
                        .length;

                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ActionChip(
                        label: Row(
                          children: [
                            // Title Method
                            Text('${method.name.toUpperCase()} - $apiByMethod'),

                            // Button to deselect filter
                          ],
                        ),
                        onPressed: apiByMethod == 0
                            ? null
                            : () {
                                // Filter API by Method
                                context.read<ParserXmlCubit>().filterByMethod(
                                  method,
                                );
                                // // Filter API by Method
                                // context.read<ParserXmlCubit>().filterByMethod(
                                //   null,
                                //   reset: true,
                                // );
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
        ],
      ),
    );
  }
}
