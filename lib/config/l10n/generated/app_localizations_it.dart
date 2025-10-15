// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get title_app => 'My Song';

  @override
  String get yes => 'Si';

  @override
  String get no => 'No';

  @override
  String get search_song => 'Cerca';

  @override
  String get theme => 'Tema';

  @override
  String get light => 'Chiaro';

  @override
  String get dark => 'Scuro';

  @override
  String get system => 'Sistema';

  @override
  String get user => 'Utente';

  @override
  String get no_history_search => 'Nessuna ricerca recente';

  @override
  String get result_search_for => 'Risultati ricerca per';

  @override
  String get favorites => 'Preferiti';

  @override
  String get no_more => 'Fine.';

  @override
  String get categ => 'Categoria';

  @override
  String category(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Categorie',
      one: 'Categoria',
    );
    return '$_temp0';
  }

  @override
  String exercise(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Esercizi',
      one: 'Esercizio',
    );
    return '$_temp0';
  }

  @override
  String get home => 'Home';

  @override
  String get reset => 'Reset';

  @override
  String get settings => 'Impostazioni';

  @override
  String get error_example => 'Error';

  @override
  String get no_empty_value => 'Il campo non può essere vuoto';
}
