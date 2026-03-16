import 'package:flutter/material.dart';
import 'package:myapigee/config/extension/extensions.dart';

class BasePath extends StatefulWidget {
  const BasePath({super.key});

  @override
  State<BasePath> createState() => _BasePathState();
}

class _BasePathState extends State<BasePath> {

  final TextEditingController _basePathCntrl = TextEditingController();

  @override
  void dispose() {
    _basePathCntrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.0,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Text(
          context.ltr.basepath,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        // TextFormField
        Row(
          children: [
            Flexible(
              child: TextFormField(
                controller: _basePathCntrl,
                decoration: InputDecoration(
                  hintText: context.ltr.basepath,
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  //context.read<CreateProxyCubit>().setBasePath(state,value);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
