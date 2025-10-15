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
      child: Padding(
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
                  return state.apiModelsFiltered == null ||
                          state.apiModelsFiltered!.isEmpty
                      ? Center(child: Text(context.ltr.yes))
                      : ListView.builder(
                          padding: EdgeInsets.only(bottom: 64.0),
                          itemCount: state.apiModelsFiltered!.length,
                          itemBuilder: (context, index) {
                            ApiModel apiModel = state.apiModelsFiltered![index];
                            return Center(
                              child: Container(
                                margin: const EdgeInsets.all(4.0),
                                padding: const EdgeInsets.all(12.0),
                                constraints: BoxConstraints(maxWidth: 800.0),
                                decoration: BoxDecoration(
                                  color: apiModel.method.color.withAlpha(150),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Api
                                    Flexible(child: Text(apiModel.api)),
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
                            );
                          },
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
