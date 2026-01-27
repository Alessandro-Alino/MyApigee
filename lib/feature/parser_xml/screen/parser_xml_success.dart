import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapigee/config/l10n/local.dart';
import 'package:myapigee/feature/parser_xml/bloc/parser_xml_cubit.dart';
import 'package:myapigee/feature/parser_xml/widget/api_list.dart';
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
                child:
                    context
                        .read<ParserXmlCubit>()
                        .state
                        .apiModelsFiltered
                        .isEmpty
                    ? Center(child: Text(context.ltr.yes))
                    : ApiList(),
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
