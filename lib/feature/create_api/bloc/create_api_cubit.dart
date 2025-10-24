import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myapigee/feature/parser_xml/model/api_model.dart';

part 'create_api_state.dart';

part 'create_api_cubit.freezed.dart';

class CreateApiCubit extends Cubit<CreateApiState> {
  CreateApiCubit() : super(CreateApiState.initState());

  String? _createEndpoint(String email) {
    List<String> result = [];
    List<ApiModel> apiModels = [];

    // Regex for METHOD
    final methodRegex = RegExp(
      r'\b(GET|POST|PUT|PATCH|DELETE|OPTIONS|HEAD|TRACE|CONNECT)\b',
      caseSensitive: false,
    );

    // Regex for apiName
    final apiNameRegex = RegExp(r'(?:^|\s)([^\s/]*(?:/[^\s/]*)+)');

    // Regex for API
    final apiRegex = RegExp(r'(\{[^}]*\}|(\*))');

    // Find Method
    final methodMatches = methodRegex.allMatches(email);

    // Find api
    final apiMatches = apiNameRegex.allMatches(email);

    // If methods or api is empty, return errorMex
    if (methodMatches.isEmpty || apiMatches.isEmpty) {
      final String errMex = 'Nessun endpoint trovato nella email.';
      log(errMex);
      emit(state.copyWith(errorMex: errMex));
    }

    // If methods and api are not equal, return errorMex
    if (methodMatches.length != apiMatches.length) {
      final String errMex =
          'CREATE_API_BLOC: Numero di metodi (${methodMatches.length}) e api (${apiMatches.length}) non coincide.';
      log(errMex);
      emit(state.copyWith(errorMex: errMex));
    }
    // If methods and api are equal, return apiModels
    if (methodMatches.length == apiMatches.length) {
      // Get number of methods and api
      final lenght = methodMatches.length;
      // For each method and api, create ApiModel and add it to the list
      for (int i = 0; i < lenght; i++) {
        // Get method from regex
        final methodz = methodMatches.elementAt(i).group(0);
        // Get API from regex
        final apiNamez = apiMatches.elementAt(i).group(1);
        // if method and api are not null, add it to the list
        if (methodz != null && apiNamez != null) {
          // METHOD
          final method = Method.values.singleWhere(
            (e) => e.name.toLowerCase() == methodz.toLowerCase(),
          );
          //API
          final api = apiNamez.replaceAll(apiRegex, '*');
          // API Name
          final apiName = apiNamez.replaceAll(apiRegex, '{id}');
          // Create ApiModel
          final ApiModel apiModel = ApiModel(
            api: api,
            method: method,
            apiName: apiName,
          );
          log('$apiModel');
          apiModels.add(apiModel);
          // Add ORG Condition variable to sharedPrefs so you can add your conditions
          final String placeholder =
              """
<Flow name="$apiName">
    <Description/>
    <Request/>
    <Response/>
    <Condition>(proxy.pathsuffix MatchesPath "$api") and (request.verb = "${method.name.toUpperCase()}")</Condition>
</Flow>
""";
          result.add(placeholder);
        }
        // if method or api is null, return errorMex
        else {
          final String errMex = 'CREATE_API_BLOC: Metodo o api non trovato.';
          log(errMex);
          emit(state.copyWith(errorMex: errMex));
        }
      }
      return result.join();
    }
    return null;
  }

  void extractEndpoint(String email) {
    final result = _createEndpoint(email) ?? '';
    emit(state.copyWith(result: result));
  }

  // Error Message
  void errorMex(String error) {
    emit(state.copyWith(errorMex: '[CREATE_API_BLOC] $error'));
    Future.delayed(const Duration(seconds: 2), () {
      emit(state.copyWith(errorMex: null));
    });
  }

  // Init
  void init() {
    emit(CreateApiState.initState());
  }
}
