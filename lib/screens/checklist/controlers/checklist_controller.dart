import 'package:get/get.dart';
import '../../../core/utils/retry_helper.dart';
import '../../../data/services/lambda_api_service.dart';

class ChecklistController extends GetxController {
  var isLoading = false.obs;
  var error = ''.obs;
  var success = ''.obs;
  var responseData = ''.obs;

  /// GET METHOD
  Future<void> fetchData() async {
    isLoading.value = true;
    error.value = '';

    try {
      final response = await RetryHelper.retry(() {
        return LambdaApiService.getData();
      });

      if (response.statusCode == 200) {
        responseData.value = response.body;
      } else {
        error.value = "GET Error: ${response.statusCode}";
      }
    } catch (e) {
      error.value = e.toString();
      print(error.value);
    } finally {
      isLoading.value = false;
    }
  }

  /// POST METHOD (your server working format)
  Future<void> sendEvent() async {
    isLoading.value = true;
    error.value = '';
    success.value = '';

    final body = {
      "userId": "123",
      "event": "button_clicked",
      "timestamp": DateTime.now().toIso8601String(),
    };

    try {
      final response = await RetryHelper.retry(() {
        return LambdaApiService.postEvent(body);
      });

      if (response.statusCode == 200) {
        success.value = "POST Success: ${response.body}";
      } else {
        error.value = "POST Error: ${response.statusCode}";
      }
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}