import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapigee/feature/parser_xml/bloc/parser_xml_cubit.dart';

class ParserXmlInitial extends StatelessWidget {
  const ParserXmlInitial({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ActionChip(
          label: const Text('Select XML'),
          onPressed: () => context.read<ParserXmlCubit>().pickFile(),
        ),
      ],
    );
  }
}
