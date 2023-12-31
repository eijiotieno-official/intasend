import 'package:intasend/intasend.dart';
import 'package:intasend/src/utils.dart';

class Customer {
  Future<Map<String, dynamic>> details({
    required bool test,
    required String customerId,
  }) async {
    return await sendGetRequest(
      endPoint: "customers/$customerId",
      publishableKey: Intasend.keys.publishableKey,
      privateKey: Intasend.keys.privateKey,
      test: test,
    );
  }

  Future<Map<String, dynamic>> create({
    required bool test,
    required String email,
  }) async {
    final Map<String, dynamic> payload = {
      'email': email,
    };
    return await sendPostRequest(
      endPoint: "customers/",
      payload: payload,
      test: test,
      publishableKey: Intasend.keys.publishableKey,
      privateKey: Intasend.keys.privateKey,
    );
  }

  Future<Map<String, dynamic>> retrieve({
    required bool test,
    String? customerId,
  }) async {
    if (customerId != null) {
      return details(test: test, customerId: customerId);
    }
    return await sendGetRequest(
      endPoint: "customers/$customerId",
      publishableKey: Intasend.keys.publishableKey,
      privateKey: Intasend.keys.privateKey,
      test: test,
    );
  }

  Future<Map<String, dynamic>> transactions({
    required bool test,
    required String customerId,
  }) async {
    return await sendGetRequest(
      endPoint: "customers/$customerId/transactions",
      publishableKey: Intasend.keys.publishableKey,
      privateKey: Intasend.keys.privateKey,
      test: test,
    );
  }
}
