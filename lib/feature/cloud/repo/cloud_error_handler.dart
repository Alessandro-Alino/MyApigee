class CloudErrorHandler {
  /// Metodo principale per gestire qualsiasi eccezione
  static String handle(Object e) {
    final errorMex = e.toString().toLowerCase();

    return switch (errorMex) {
      _ when errorMex.contains('invalid argument') =>
        'Username o Password errate. Riprova!',

      _ => 'An unexpected error occurred. Please try again.',
    };
  }
}
