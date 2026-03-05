class RetryHelper {
  static Future<T> retry<T>(
      Future<T> Function() function, {
        int retries = 3,
      }) async {
    int attempt = 0;

    while (attempt < retries) {
      try {
        return await function();
      } catch (e) {
        attempt++;
        if (attempt >= retries) rethrow;
        await Future.delayed(Duration(seconds: attempt * 2));
      }
    }

    throw Exception("Retry failed");
  }
}