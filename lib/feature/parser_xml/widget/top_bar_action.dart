import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myapigee/feature/parser_xml/bloc/parser_xml_cubit.dart';
import 'package:myapigee/feature/parser_xml/model/api_model.dart';

class TopBarAction extends StatelessWidget {
  const TopBarAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey.shade700,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: ListTile(
          // Title
          title: RichText(
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
              style: Theme.of(context).textTheme.titleMedium,
              children: [
                TextSpan(text: 'File: '),
                TextSpan(
                  text: '${context.read<ParserXmlCubit>().state.fileName}',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // Subtitle
          subtitle: RichText(
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
              style: Theme.of(context).textTheme.bodySmall,
              children: [
                TextSpan(text: 'Basepath: '),
                TextSpan(
                  text: '${context.read<ParserXmlCubit>().state.basepath}',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          dense: true,
          // Action Button
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Popup Export Data
              PopupMenuButton(
                offset: Offset(-20, 40),
                color: Colors.blueGrey.shade900,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.grey.withAlpha(150),
                    width: 0.8,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                itemBuilder: (context) {
                  return [
                    // Export Postman Collection
                    PopupMenuItem(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: SvgPicture.asset(
                              'assets/svg/postman.svg',
                              semanticsLabel: 'Postman Icon',
                              height: 25,
                              width: 225,
                            ),
                          ),
                          const Text('Export Postman'),
                        ],
                      ),
                      onTap: () {
                        List<ApiModel> apiListToExport = [];
                        if (context.read<ParserXmlCubit>().state.apiToExport ==
                                null ||
                            context
                                .read<ParserXmlCubit>()
                                .state
                                .apiToExport!
                                .isEmpty) {
                          apiListToExport = context
                              .read<ParserXmlCubit>()
                              .state
                              .apiModels;
                        } else {
                          apiListToExport = context
                              .read<ParserXmlCubit>()
                              .state
                              .apiToExport!;
                        }
                        // Export List of API
                        context.read<ParserXmlCubit>().exportPostman(
                          apiListToExport,
                        );
                      },
                    ),
                    // Export Exel
                    PopupMenuItem(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: SvgPicture.asset(
                              'assets/svg/excel.svg',
                              semanticsLabel: 'Excel Icon',
                              height: 25,
                              width: 25,
                            ),
                          ),
                          const Text('Export Excel'),
                        ],
                      ),
                      onTap: () {
                        List<ApiModel> apiListToExport = [];
                        if (context.read<ParserXmlCubit>().state.apiToExport ==
                                null ||
                            context
                                .read<ParserXmlCubit>()
                                .state
                                .apiToExport!
                                .isEmpty) {
                          apiListToExport = context
                              .read<ParserXmlCubit>()
                              .state
                              .apiModels;
                        } else {
                          apiListToExport = context
                              .read<ParserXmlCubit>()
                              .state
                              .apiToExport!;
                        }
                        // Export List of API
                        context.read<ParserXmlCubit>().exportExcel(
                          apiListToExport,
                        );
                      },
                    ),
                  ];
                },
              ),
              // Restart Select File XML
              IconButton(
                onPressed: () {
                  context.read<ParserXmlCubit>().init();
                },
                icon: const Icon(Icons.restart_alt_outlined),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
