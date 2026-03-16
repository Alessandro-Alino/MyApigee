import 'package:myapigee/feature/create_proxy/utils/env_config/oam_config.dart';
import 'package:myapigee/feature/create_proxy/utils/env_config/ocm_config.dart';
import 'package:myapigee/feature/create_proxy/utils/template_config.dart';

enum GCPDatacenter { milan, amsterdam }

enum GCPEnv { sit, uat, prd, prdExt }

enum GCPCountry { at, de, it }

enum GCPprj {
  cae(config: OAM.oamConfig),
  f4p(config: OAM.oamConfig),
  oam(config: OAM.oamConfig),
  ocm(config: OCM.ocmConfig),
  pef(config: OAM.oamConfig);

  const GCPprj({required this.config});

  final TemplateConfig config;
}

class GCP {
  final GCPDatacenter datacenter;
  final String sit;
  final String uat;
  final String prd;
  final String? prdExt;
  final String prefix;

  const GCP({
    required this.datacenter,
    required this.sit,
    required this.uat,
    required this.prd,
    this.prdExt,
    required this.prefix,
  });

  // MILAN
  static const milan = GCP(
    datacenter: GCPDatacenter.milan,
    sit: 'prj-g4c-dev-apigee-int-001',
    uat: 'prj-g4c-qat-apigee-int-001',
    prd: 'prj-g4c-prd-apigee-int-001',
    prefix: '001-',
  );

  // AMSTERDAM
  static const amsterdam = GCP(
    datacenter: GCPDatacenter.amsterdam,
    sit: 'ucs-us-g4c-pez-hvpc-01',
    uat: 'ucs-g4c-dmz-003-apigee-uat',
    prd: 'ucs-g4c-dmz-001-apigee-prd-int',
    prdExt: 'ucs-g4c-dmz-001-apigee-prd-ext',
    prefix: '',
  );

  // Datacenter List
  static List<GCP> get datacenterList => [milan, amsterdam];

  // List of GCPCountry
  static List<String> listCountry = GCPCountry.values
      .map((e) => e.name)
      .toList();

  // GCP listEnv
  static List<String> get listEnv => GCPprj.values.map((e) => e.name).toList();
}
