import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapigee/feature/parser_xml/bloc/parser_xml_cubit.dart';
import 'package:myapigee/feature/parser_xml/screen/parser_xml_initial.dart';
import 'package:myapigee/feature/parser_xml/screen/parser_xml_selected.dart';
import 'package:myapigee/feature/parser_xml/screen/parser_xml_success.dart';
import 'package:myapigee/widget/app_loading.dart';
import 'package:myapigee/widget/app_snackbar.dart';

@RoutePage()
class ParserXmlPage extends StatelessWidget {
  const ParserXmlPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ParserXmlCubit, ParserXmlState>(
      listener: (context, state) {
        // Shoe Error Mex
        if (state.errorMex != null) {
          context.appSnackBar(
            child: Text('${state.errorMex}'),
            icon: Icons.close,
            isError: true,
          );
        }
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Reset Btn
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 16.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton.outlined(
                    onPressed: () => context.read<ParserXmlCubit>().init(),
                    icon: Icon(Icons.refresh_rounded),
                  ),
                ],
              ),
            ),
            // Status
            switch (state.status) {
              // Initial
              ParserXmlStatus.initial => ParserXmlInitial(),
              //Selected
              ParserXmlStatus.selected => ParserXmlSelected(),
              // Loading
              ParserXmlStatus.loading => AppLoading(),
              // Success
              ParserXmlStatus.success => ParserXmlSuccess(),
            },
          ],
        );
      },
    );
  }
}
