import 'package:flutter/material.dart';
import 'package:myapigee/config/l10n/generated/app_localizations.dart';

extension BuildContextHelper on BuildContext {
  AppLocalizations get ltr {
    return AppLocalizations.of(this)!;
  }
}
