import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapigee/config/extension/extensions.dart';
import 'package:myapigee/feature/create_proxy/bloc/create_proxy_cubit.dart';

class Proxy extends StatefulWidget {
  const Proxy({super.key});

  @override
  State<Proxy> createState() => _ProxyState();
}

class _ProxyState extends State<Proxy> {
  final TextEditingController _nameProxyCntrl = TextEditingController();
  final TextEditingController _basepathProxyCntrl = TextEditingController();
  final TextEditingController _basepathTargetCntrl = TextEditingController();

  @override
  void dispose() {
    _nameProxyCntrl.dispose();
    _basepathProxyCntrl.dispose();
    _basepathTargetCntrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateProxyCubit, CreateProxyState>(
      listener: (context, state) {
        // Clear TextField when user clear data
        if (state.status == CreateProxyStatus.initial) {
          _nameProxyCntrl.clear();
          _basepathProxyCntrl.clear();
          _basepathTargetCntrl.clear();
        }
      },
      builder: (context, state) {
        return Column(
          spacing: 8.0,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              context.ltr.proxy,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            // TextFormField
            Row(
              children: [
                Flexible(
                  child: TextFormField(
                    controller: _nameProxyCntrl,
                    decoration: InputDecoration(
                      labelText: context.ltr.name_proxy,
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      // Set Proxy-Name
                      context.read<CreateProxyCubit>().setRawText(value);
                    },
                  ),
                ),
              ],
            ),
            // Basepath
            Row(
              spacing: 8.0,
              children: [
                Flexible(
                  child: TextFormField(
                    controller: _basepathProxyCntrl,
                    decoration: InputDecoration(
                      labelText: context.ltr.basepath_proxy,
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      // Set ProxyName
                      context.read<CreateProxyCubit>().setBasepathProxy(value);
                    },
                  ),
                ),
                Flexible(
                  child: TextFormField(
                    controller: _basepathTargetCntrl,
                    decoration: InputDecoration(
                      labelText: context.ltr.basepath_target,
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      // Set ProxyName
                      context.read<CreateProxyCubit>().setBasepathTarget(value);
                    },
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
