import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapigee/feature/cloud/bloc/cloud_cubit.dart';

class Breadcrumb extends StatefulWidget {
  const Breadcrumb({super.key});

  @override
  State<Breadcrumb> createState() => _BreadcrumbState();
}

class _BreadcrumbState extends State<Breadcrumb> {
  final ScrollController _scrollCntrl = ScrollController();

  @override
  void dispose() {
    _scrollCntrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CloudCubit, CloudState>(
      listener: (context, state) {
        // Scroll to last element
        if (state.breadcrumb.isNotEmpty) {
          _scrollCntrl.animateTo(
            _scrollCntrl.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      },
      builder: (context, state) {
        return Card(
          child: SizedBox(
            height: 50.0,
            child: Row(
              children: [
                // Icon to navigate to Cloud Home directory
                Padding(
                  padding: const EdgeInsets.only(left:8.0,right: 4.0),
                  child: IconButton.filledTonal(
                    onPressed: () {
                      // Reset Breadcrumb
                      context.read<CloudCubit>().refreshBreadcrumb();
                    },
                    icon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal:4.0),
                      child: const Icon(Icons.home),
                    ),
                  ),
                ),
                // Breadcrumb list
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ListView.builder(
                      controller: _scrollCntrl,
                      scrollDirection: Axis.horizontal,
                      itemCount: state.breadcrumb.length,
                      itemBuilder: (context, index) {
                        final String path = state.breadcrumb[index];
                        final bool isLast =
                            index == state.breadcrumb.length - 1;
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            children: [
                              TextButton(
                                onPressed: () {
                                  // Load file and set Breadcrumb by Index
                                  context.read<CloudCubit>().loadFiles(
                                    path: path,
                                    index: index,
                                  );
                                },
                                child: Text(
                                  path,
                                  style: Theme.of(context).textTheme.bodyMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.w700,
                                        color: isLast
                                            ? Theme.of(
                                                context,
                                              ).colorScheme.primary
                                            : Colors.white70,
                                      ),
                                ),
                              ),
                              // Add ">" if is not last element
                              if (!isLast) const BreadcrumbSeparator(),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class BreadcrumbSeparator extends StatelessWidget {
  const BreadcrumbSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: Text(
        '>',
        style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
      ),
    );
  }
}
