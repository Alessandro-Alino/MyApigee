import 'package:flutter/material.dart';
import 'package:myapigee/config/l10n/generated/app_localizations.dart';

extension BuildContextHelper on BuildContext {
  AppLocalizations get ltr {
    return AppLocalizations.of(this)!;
  }
}

// Capitalized first char
extension StringHelper on String {
  String get capitalized {
    if (isEmpty) return this;
    if (length == 1) return toUpperCase();
    String capitalized = '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
    return capitalized;
  }
}

extension FormatFileSize on int {
  //Format size of number in MB
  String formatFileSize() {
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
