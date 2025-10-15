// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get title_app => 'My Song';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get search_song => 'Search';

  @override
  String get theme => 'Theme';

  @override
  String get light => 'Light';

  @override
  String get dark => 'Dark';

  @override
  String get system => 'System';

  @override
  String get user => 'User';

  @override
  String get no_history_search => 'History search empty';

  @override
  String get result_search_for => 'Search result for';

  @override
  String get favorites => 'Favorites';

  @override
  String get no_more => 'The end.';

  @override
  String get categ => 'Category';

  @override
  String category(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Categories',
      one: 'Category',
    );
    return '$_temp0';
  }

  @override
  String exercise(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Exercises',
      one: 'Exercise',
    );
    return '$_temp0';
  }

  @override
  String get home => 'Home';

  @override
  String get reset => 'Reset';

  @override
  String get settings => 'Settings';

  @override
  String get error_example => 'Error';

  @override
  String get no_empty_value => 'The field cannot be empty';
}
