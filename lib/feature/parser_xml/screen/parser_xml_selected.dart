import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapigee/feature/parser_xml/bloc/parser_xml_cubit.dart';

class ParserXmlSelected extends StatelessWidget {
  const ParserXmlSelected({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ParserXmlCubit, ParserXmlState>(
      builder: (context, state) {
        return Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                // Filename
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Filename: '),
                        Text(
                          '${state.fileName}',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                ),
                // Start Parsing XML
                ActionChip(
                  label: const Text('Start Parsing XML'),
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  avatar: Icon(Icons.play_arrow),
                  onPressed: () {
                    // If the file is not null, parse the XML
                    if (state.file != null) {
                      context.read<ParserXmlCubit>().parseXml(
                        state.file!.readAsStringSync(),
                      );
                    }
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
