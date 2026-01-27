import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapigee/feature/parser_xml/bloc/parser_xml_cubit.dart';

class ParserXmlInitial extends StatefulWidget {
  const ParserXmlInitial({super.key});

  @override
  State<ParserXmlInitial> createState() => _ParserXmlInitialState();
}

class _ParserXmlInitialState extends State<ParserXmlInitial> {
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16.0,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ActionChip(
          label: const Text('Select XML'),
          onPressed: () => context.read<ParserXmlCubit>().pickFile(),
        ),
        Container(
          constraints: const BoxConstraints(maxWidth: 300.0),
          child: TextField(
            controller: _textController,
            maxLines: 6,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: 'Paste XML',
              suffixIcon: IconButton(
                onPressed: () {
                  if(_textController.text.isNotEmpty){
                    context.read<ParserXmlCubit>().parseXml(
                      providedXml: _textController.text,
                    );
                  }
                },
                icon: const Icon(Icons.check),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
