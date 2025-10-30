extension FormatFileSize on int {
  //Format size of number in MB
  formatFileSize() {
    const int kb = 1024;
    const int mb = kb * 1024;
    const int gb = mb * 1024;
    const int tb = gb * 1024;

    switch (this) {
      case 0:
        return '0 MB';
      case final size when size < mb:
        return '${(this / kb).toStringAsFixed(2)} KB';
      case final size when size < gb:
        return '${(this / mb).toStringAsFixed(2)} MB';
      case final size when size < tb:
        return '${(this / gb).toStringAsFixed(2)} GB';
      default:
        return '${(this / tb).toStringAsFixed(2)} TB';
    }
  }
}
