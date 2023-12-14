import 'package:intasend/intasend.dart';
import 'package:intasend/src/utils.dart';

class ChargeBacks {
  Future<Map<String, dynamic>> create({
    required bool test,
    required dynamic invoice,
    required int amount,
    required String reason,
    required String reasonDetails,
  }) async {
    final Map<String, dynamic> payload = {
      "invoice": invoice,
      "amount": amount,
      "reason": reason,
      "reason_details": reasonDetails
    };
    return await sendPostRequest(
      endPoint: "chargebacks/",
      payload: payload,
      test: test,
      publishableKey: Intasend.keys.publishableKey,
      privateKey: Intasend.keys.privateKey,
    );
  }

  Future<Map<String, dynamic>> retrieve({
    required bool test,
    String? chargebackId,
  }) async {
    if (chargebackId != null) {
      return details(test: test, chargebackId: chargebackId);
    }
    return await sendGetRequest(
      endPoint: "chargebacks/",
      publishableKey: Intasend.keys.publishableKey,
      privateKey: Intasend.keys.privateKey,
      test: test,
    );
  }

  Future<Map<String, dynamic>> details({
    required bool test,
    required String chargebackId,
  }) async {
    return await sendGetRequest(
      endPoint: "chargebacks/$chargebackId",
      publishableKey: Intasend.keys.publishableKey,
      privateKey: Intasend.keys.privateKey,
      test: test,
    );
  }
}
