import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapigee/config/extension/extensions.dart';
import 'package:myapigee/feature/create_proxy/bloc/create_proxy_cubit.dart';
import 'package:myapigee/feature/create_proxy/utils/gcp_data.dart';

class Datacenter extends StatefulWidget {
  const Datacenter({super.key});

  @override
  State<Datacenter> createState() => _DatacenterState();
}

class _DatacenterState extends State<Datacenter> {
  @override
  void initState() {
    context.read<CreateProxyCubit>().setGCP(GCP.milan);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateProxyCubit, CreateProxyState>(
      builder: (context, state) {
        return Column(
          spacing: 8.0,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text('Datacenter', style: Theme.of(context).textTheme.titleMedium),
            // TextFormField
            SizedBox(
              height: 40.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: GCP.datacenterList.length,
                itemBuilder: (context, index) {
                  final GCP gcp = GCP.datacenterList[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: FilterChip(
                      label: Text(gcp.datacenter.name.capitalized),
                      selected:
                          gcp.datacenter.name == state.gcp.datacenter.name,
                      onSelected: (e) {
                        if (gcp.datacenter.name == state.gcp.datacenter.name) {
                          return;
                        }
                        // Set GCP
                        context.read<CreateProxyCubit>().setGCP(gcp);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
