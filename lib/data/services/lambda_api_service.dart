import '../../core/network/api_client.dart';

class LambdaApiService {
  static const String url =
      "https://f5wlu27xan6x2hzrtto7rtaec40bfkzu.lambda-url.us-east-1.on.aws/";

  /// GET CALL
  static Future getData() async {
    return await ApiClient.get(url);
  }

  /// POST CALL (your working one)
  static Future postEvent(Map<String, dynamic> body) async {
    return await ApiClient.post(url, body);
  }
}