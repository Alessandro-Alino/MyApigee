import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:flutter_highlight/themes/vs2015.dart';
import 'package:highlight/languages/xml.dart';
import 'package:myapigee/feature/parser_xml/bloc/parser_xml_cubit.dart';

class CodeViewer extends StatefulWidget {
  const CodeViewer({super.key});

  @override
  State<CodeViewer> createState() => _CodeViewerState();
}

class _CodeViewerState extends State<CodeViewer> {
  final CodeController _controller = CodeController(
    language: xml,
    readOnly: true,
  );

  @override
  void initState() {
    super.initState();
    if (context.read<ParserXmlCubit>().state.xml != null) {
      _controller.fullText = context.read<ParserXmlCubit>().state.xml ?? 'Null';
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Code Editor
        CodeTheme(
          data: CodeThemeData(styles: vs2015Theme),
          child: SingleChildScrollView(
            child: CodeField(
              controller: _controller,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ),
        ),
        // Close Button
        Positioned(
          top: 16.0,
          right: 16.0,
          child: IconButton.outlined(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.close),
          ),
        ),
      ],
    );
  }
}
