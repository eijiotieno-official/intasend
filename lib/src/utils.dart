import 'dart:convert';

import 'package:http/http.dart' as http;

String host = "https://payment.intasend.com";
String testHost = "https://sandbox.intasend.com";

String activeHost({required bool test}) => test ? testHost : host;

/// Call [sendRequest] for POST operations method
Future<Map<String, dynamic>> sendPostRequest({
  required String endPoint,
  required Map<String, dynamic> payload,
  required String? publishableKey,
  required String? privateKey,
  required bool test,
}) async {
  String url = "${activeHost(test: test)}/api/v1/$endPoint";

  try {
    http.Response response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'INTASEND_PUBLIC_API_KEY': publishableKey!,
        'Authorization': 'Bearer $privateKey',
      },
      body: jsonEncode(payload),
    );

    Map<String, dynamic> data = jsonDecode(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return data;
    } else {
      throw Exception(data['errors'][0]['detail']);
    }
  } catch (e) {
    throw Exception(e);
  }
}

/// Call [sendRequest] for GET operations method
Future<Map<String, dynamic>> sendGetRequest({
  required String endPoint,
  required String? publishableKey,
  required String? privateKey,
  required bool test,
}) async {
  String url = "${activeHost(test: test)}/api/v1/$endPoint";

  try {
    http.Response response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'INTASEND_PUBLIC_API_KEY': publishableKey!,
        'Authorization': 'Bearer $privateKey',
      },
    );

    Map<String, dynamic> data = jsonDecode(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return data;
    } else {
      throw Exception(data['errors'][0]['detail']);
    }
  } catch (e) {
    throw Exception(e);
  }
}

List bankCodes = [
  {"bank_name": "KCB", "bank_code": "1"},
  {"bank_name": "Standard Charted Bank KE", "bank_code": "2"},
  {"bank_name": "Barclays Bank", "bank_code": "3"},
  {"bank_name": "NCBA", "bank_code": "7"},
  {"bank_name": "Prime Bank", "bank_code": "10"},
  {"bank_name": "Cooperative Bank", "bank_code": "11"},
  {"bank_name": "National Bank", "bank_code": "12"},
  {"bank_name": "Citibank", "bank_code": "16"},
  {"bank_name": "Habib Bank AG Zurich", "bank_code": "17"},
  {"bank_name": "Middle East Bank", "bank_code": "18"},
  {"bank_name": "Bank of Africa", "bank_code": "19"},
  {"bank_name": "Consolidated Bank", "bank_code": "23"},
  {"bank_name": "Credit Bank Ltd", "bank_code": "25"},
  {"bank_name": "Stanbic Bank", "bank_code": "31"},
  {"bank_name": "ABC Bank", "bank_code": "35"},
  {"bank_name": "Spire Bank", "bank_code": "49"},
  {"bank_name": "Paramount Universal Bank", "bank_code": "50"},
  {"bank_name": "Jamii Bora Bank", "bank_code": "51"},
  {"bank_name": "Guaranty Bank", "bank_code": "53"},
  {"bank_name": "Victoria Commercial Bank", "bank_code": "54"},
  {"bank_name": "Guardian Bank", "bank_code": "55"},
  {"bank_name": "I&M Bank", "bank_code": "57"},
  {"bank_name": "DTB", "bank_code": "63"},
  {"bank_name": "Sidian Bank", "bank_code": "66"},
  {"bank_name": "Equity Bank", "bank_code": "68"},
  {"bank_name": "Family Bank", "bank_code": "70"},
  {"bank_name": "Gulf African Bank", "bank_code": "72"},
  {"bank_name": "First Community Bank", "bank_code": "74"},
  {"bank_name": "KWFT Bank", "bank_code": "78"},
  {"bank_name": "Housing Finance Company Limited (HFCK)", "bank_code": "61"},
  {"bank_name": "Mayfair Bank Limited", "bank_code": "65"}
];
