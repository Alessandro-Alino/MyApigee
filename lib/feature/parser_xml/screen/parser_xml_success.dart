import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapigee/config/l10n/local.dart';
import 'package:myapigee/feature/parser_xml/bloc/parser_xml_cubit.dart';
import 'package:myapigee/feature/parser_xml/model/api_model.dart';
import 'package:myapigee/feature/parser_xml/widget/filter_method.dart';
import 'package:myapigee/feature/parser_xml/widget/top_bar_action.dart';

class ParserXmlSuccess extends StatelessWidget {
  const ParserXmlSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TopBar and Action
              TopBarAction(),
              // Filter Method
              FilterMethod(),
              // List API
              Expanded(
                child: BlocBuilder<ParserXmlCubit, ParserXmlState>(
                  builder: (context, state) {
                    return
                            state.apiModelsFiltered.isEmpty
                        ? Center(child: Text(context.ltr.yes))
                        : ListView.builder(
                            padding: EdgeInsets.only(bottom: 64.0),
                            itemCount: state.apiModelsFiltered.length,
                            itemBuilder: (context, index) {
                              ApiModel apiModel =
                                  state.apiModelsFiltered[index];
                              return Center(
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(8.0),
                                  onLongPress: () {
                                    if (state.isSelectMode) {
                                      // Toggle Select Mode
                                      context
                                          .read<ParserXmlCubit>()
                                          .toggleSelectMode(false);
                                    }else{
                                    // Toggle Select Mode
                                    context
                                        .read<ParserXmlCubit>()
                                        .toggleSelectMode(true);
                                    // Add First API to Export list
                                    context
                                        .read<ParserXmlCubit>()
                                        .selectAPItoExport(apiModel);
                                    }
                                  },
                                  onTap: () {
                                    // Add API to Export list
                                    context
                                        .read<ParserXmlCubit>()
                                        .selectAPItoExport(apiModel);
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.all(4.0),
                                    padding: const EdgeInsets.all(12.0),
                                    decoration: BoxDecoration(
                                      color: apiModel.method.color.withAlpha(
                                        150,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        // API
                                        Row(
                                          spacing: state.isSelectMode
                                              ? 12.0
                                              : 8.0,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            // Only if selected mode
                                            AnimatedContainer(
                                              width: state.isSelectMode
                                                  ? 24.0
                                                  : 0.0,
                                              height: 24.0,
                                              duration: Durations.short2,
                                              child: Visibility(
                                                visible: state.isSelectMode,
                                                child: Checkbox(
                                                  value:
                                                      state.apiToExport
                                                          ?.contains(
                                                            apiModel,
                                                          ) ??
                                                      false,
                                                  onChanged: (e) {
                                                    // Add API to Export list
                                                    context
                                                        .read<ParserXmlCubit>()
                                                        .selectAPItoExport(apiModel);
                                                  },
                                                ),
                                              ),
                                            ),
                                            // Api
                                            Flexible(child: Text(apiModel.api)),
                                          ],
                                        ),
                                        // Method
                                        Text(
                                          apiModel.method.name.toUpperCase(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ],
                                    ),
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
        ),
        floatingActionButton: Visibility(
          visible: context.watch<ParserXmlCubit>().state.isSelectMode,
          child: FloatingActionButton.extended(
            onPressed: () {
              // Toggle Select Mode
              context.read<ParserXmlCubit>().toggleSelectMode(false);
            },
            label: Text('Close selection'),
            icon: const Icon(Icons.close),
          ),
        ),
      ),
    );
  }
}
