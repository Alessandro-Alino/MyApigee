import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapigee/feature/create_proxy/bloc/create_proxy_cubit.dart';
import 'package:myapigee/feature/create_proxy/utils/gcp_data.dart';

class EnvAndCountry extends StatefulWidget {
  const EnvAndCountry({super.key});

  @override
  State<EnvAndCountry> createState() => _EnvAndCountryState();
}

class _EnvAndCountryState extends State<EnvAndCountry> {

  final TextEditingController _envCntrl = TextEditingController();
  final TextEditingController _countryCntrl = TextEditingController();

  @override
  void dispose() {
    _envCntrl.dispose();
    _countryCntrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateProxyCubit, CreateProxyState>(
      listener: (context, state) {
        // Clear TextField when user clear data
        if(state.status==CreateProxyStatus.initial){
          _envCntrl.clear();
          _countryCntrl.clear();
        }
      },
      builder: (context, state) {
        return SizedBox(
          height: 90.0,
          child: Row(
            spacing: 16.0,
            children: [
              // Select Env
              Flexible(
                child: Column(
                  spacing: 4.0,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text('Environment',style: Theme.of(context).textTheme.titleMedium),
                    // DropDown Menu
                    DropdownMenuFormField(
                      controller: _envCntrl,
                      hintText: 'Env',
                      dropdownMenuEntries: GCP.listEnv
                          .map((e) => DropdownMenuEntry(value: e, label: e.toUpperCase()))
                          .toList(),
                      onSelected: (value) {
                        if (value == null) {
                          return;
                        }
                        context.read<CreateProxyCubit>().setEnv(value);
                      },
                    ),
                  ],
                ),
              ),
              // Select Country
              Flexible(
                child: Column(
                  spacing: 4.0,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text('Country',style: Theme.of(context).textTheme.titleMedium),
                    // DropDown Menu
                    DropdownMenuFormField(
                      controller: _countryCntrl,
                      hintText: 'State',
                      dropdownMenuEntries: GCP.listCountry
                          .map((e) => DropdownMenuEntry(value: e, label: e.toUpperCase()))
                          .toList(),
                      onSelected: (value) {
                        if (value == null) {
                          return;
                        }
                        context.read<CreateProxyCubit>().setCountryCode(value);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
