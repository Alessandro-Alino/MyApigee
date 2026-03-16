import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapigee/config/extension/extensions.dart';
import 'package:myapigee/feature/create_proxy/bloc/create_proxy_cubit.dart';

class ProxyPreview extends StatelessWidget {
  const ProxyPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: ExpansionTile(
        shape: const Border(),
        title: Text(context.ltr.preview),
        children: [
          BlocBuilder<CreateProxyCubit, CreateProxyState>(
            builder: (context, state) {
              return Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Proxy
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        Text(
                          'Proxy',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        // ProxyName
                        Row(
                          spacing: 8.0,
                          children: [
                            Text('ProxyName:'),
                            SelectableText(state.proxyName),
                          ],
                        ),
                        // RepoName
                        Row(
                          spacing: 8.0,
                          children: [
                            Text('Proxy Repo name:'),
                            SelectableText(state.repoName),
                          ],
                        ),
                        // BasePath
                        Row(
                          spacing: 8.0,
                          children: [
                            Text('BasePath Proxy:'),
                            SelectableText(state.basepathProxy),
                          ],
                        ),
                      ],
                    ),
                    const Divider(),
                    // Target
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        Text(
                          'Target',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        // TargetName
                        Row(
                          spacing: 8.0,
                          children: [
                            Text('TargetName:'),
                            SelectableText(state.targetName),
                          ],
                        ),
                        // RepoName
                        Row(
                          spacing: 8.0,
                          children: [
                            Text('Target Repo name:'),
                            SelectableText(state.repoTargetName),
                          ],
                        ),
                        // BasePath
                        Row(
                          spacing: 8.0,
                          children: [
                            Text('BasePath Target:'),
                            SelectableText(state.basepathTarget),
                          ],
                        ),
                      ],
                    ),
                    const Divider(),
                    // GCP
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        Text(
                          'GCP',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        // Datacenter
                        Row(
                          spacing: 8.0,
                          children: [
                            Text('Datacenter:'),
                            SelectableText(
                              state.gcp.datacenter.name.capitalized,
                            ),
                          ],
                        ),
                        // Env
                        Row(
                          spacing: 8.0,
                          children: [
                            Text('Env:'),
                            SelectableText(state.env.toUpperCase()),
                          ],
                        ),
                        // Country
                        Row(
                          spacing: 8.0,
                          children: [
                            Text('Country:'),
                            SelectableText(state.countryCode.toUpperCase()),
                          ],
                        ),
                        // GCP SIT
                        Row(
                          spacing: 8.0,
                          children: [
                            Text('GCP SIT:'),
                            SelectableText(state.gcp.sit),
                          ],
                        ),
                        // GCP UAT
                        Row(
                          spacing: 8.0,
                          children: [
                            Text('GCP UAT:'),
                            SelectableText(state.gcp.uat),
                          ],
                        ),
                        // GCP PRD
                        Row(
                          spacing: 8.0,
                          children: [
                            Text('GCP PRD:'),
                            SelectableText(state.gcp.prd),
                          ],
                        ),
                        // GCP PRD EXT
                        if (state.gcp.prdExt != null)
                          Row(
                            spacing: 8.0,
                            children: [
                              Text('GCP PRD EXT:'),
                              SelectableText(state.gcp.prdExt ?? ''),
                            ],
                          ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
