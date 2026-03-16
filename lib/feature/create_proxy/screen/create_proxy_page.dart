import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapigee/feature/create_proxy/bloc/create_proxy_cubit.dart';
import 'package:myapigee/feature/create_proxy/widget/datacenter.dart';
import 'package:myapigee/feature/create_proxy/widget/env_and_country.dart';
import 'package:myapigee/feature/create_proxy/widget/proxy.dart';
import 'package:myapigee/feature/create_proxy/widget/output_path.dart';
import 'package:myapigee/feature/create_proxy/widget/proxy_preview.dart';
import 'package:myapigee/widget/snackbar/app_snackbar.dart';

@RoutePage()
class CreateProxyPage extends StatefulWidget {
  const CreateProxyPage({super.key});

  @override
  State<CreateProxyPage> createState() => _CreateProxyPageState();
}

class _CreateProxyPageState extends State<CreateProxyPage> {
  @override
  void initState() {
    context.read<CreateProxyCubit>().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              spacing: 16.0,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Select outputPath
                OutputPath(),
                // Datacenter
                Datacenter(),
                // Select Env and Country
                EnvAndCountry(),
                // Name Proxy
                Proxy(),
                // Button to Generate
                Row(
                  spacing: 8.0,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BlocListener<CreateProxyCubit, CreateProxyState>(
                      listener: (context, state) {
                        // Show InfoMex
                        if (state.infoMex != null) {
                          context.appSnackBar(infoMex: state.infoMex!);
                        }
                      },
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<CreateProxyCubit>().generateProject();
                        },
                        child: const Text('Genera'),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        context.read<CreateProxyCubit>().init();
                      },
                      icon: Icon(Icons.refresh),
                    ),
                  ],
                ),
                // Preview
                ProxyPreview(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
