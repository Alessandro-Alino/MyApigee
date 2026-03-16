class TemplateConfig {
  final List<String> proxyFiles;
  final List<String> proxyFilesToCopy;
  final List<String> targetFiles;
  final List<String> targetFilesToCopy;

  const TemplateConfig({
    required this.proxyFiles,
    required this.targetFiles,
    required this.proxyFilesToCopy,
    required this.targetFilesToCopy,
  });
}
