import 'package:myapigee/feature/create_proxy/utils/template_config.dart';

class OCM {
  static const TemplateConfig ocmConfig = TemplateConfig(
    proxyFiles: [
      'apiproxy/proxies/default.xml',
      'apiproxy/targets/te-{countryCodeUpperCase}.xml',
      'apiproxy/{proxyName}.xml',
      'devops/configuration.yaml',
      'devops/configuration-develop.yaml',
      'devops/configuration-deploy-uat.yaml',
      'devops/configuration-deploy-prod.yaml',
      'package.json',
    ],
    proxyFilesToCopy: [
      'apiproxy/policies/AM-inputError.xml',
      'apiproxy/policies/AM-setSIEMIndex.xml',
      'apiproxy/policies/FC-logICT.xml',
      'apiproxy/policies/FC-logSIEM.xml',
      'apiproxy/policies/FC-logTS.xml',
      'apiproxy/policies/FC-securityChecks.xml',
      'apiproxy/policies/FC-setCors.xml',
      'apiproxy/policies/JS-setLoggingVariables.xml',
      'apiproxy/policies/RF-flowNotFound.xml',
      'apiproxy/resources/jsc/Set-Siem-ICT-Variables.js',
      'devops/application.yaml',
      'Jenkinsfile',
    ],
    targetFiles: [
      'devops/configuration.yaml',
      'devops/configuration-develop.yaml',
      'devops/configuration-deploy-uat.yaml',
      'devops/configuration-deploy-prod.yaml',
      'targetservers/{rawText}-prd.json',
      'targetservers/{rawText}-sit.json',
      'targetservers/{rawText}-uat.json',
      'package.json',
    ],
    targetFilesToCopy: [
      'devops/application.yaml',
      'Jenkinsfile',
    ],
  );
}