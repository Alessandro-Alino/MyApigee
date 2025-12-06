import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapigee/feature/parser_xml/bloc/parser_xml_cubit.dart';

class TopBarAction extends StatelessWidget {
  const TopBarAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          spacing: 16.0,
          mainAxisSize: MainAxisSize.max,
          children: [
            // Title of Method
            Expanded(
              child: Row(
                spacing: 16.0,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    child: Text(
                      'File:',
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      '${context.read<ParserXmlCubit>().state.fileName}',
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            // Action Button
            Row(
              spacing: 16.0,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Reset Filter
                IconButton(
                  onPressed: () {
                    // Filter API by Method
                    context.read<ParserXmlCubit>().filterByMethod(
                      null,
                      reset: true,
                    );
                  },
                  icon: Icon(Icons.refresh_rounded),
                ),
                // IconButton Action
                PopupMenuButton(
                  offset: Offset(-20, 40),
                  color: Colors.blueGrey.shade900,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.grey.withAlpha(150), width: 0.8),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  itemBuilder: (context) {
                    return [
                      // Export Postman Collection
                      PopupMenuItem(
                        child: const Text('Export Postman'),
                      ),
                      // Export Exel
                      PopupMenuItem(
                        child: const Text('Export Exel'),
                      ),
                    ];
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
