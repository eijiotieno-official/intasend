import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intasend/intasend.dart';

// Define the production and test hosts
String host = "https://payment.intasend.com";
String testHost = "https://sandbox.intasend.com";

// Function to determine the active host based on the test parameter
String activeHost({required bool test}) => test ? testHost : host;

/// Function for making POST requests
Future<Map<String, dynamic>> sendPostRequest({
  required String endPoint,
  required Map<String, dynamic>? payload,
  required String? publishableKey,
  required String? privateKey,
  required bool test,
}) async {
  // Construct the complete URL for the POST request
  String url = "${activeHost(test: test)}/api/v1/$endPoint";

  try {
    // Make the HTTP POST request
    http.Response response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'INTASEND_PUBLIC_API_KEY': publishableKey!,
        'Authorization': 'Bearer $privateKey',
      },
      body: payload == null ? null : jsonEncode(payload),
    );

    // Decode the response body into a Map
    Map<String, dynamic> data = jsonDecode(response.body);

    // Check if the request was successful (status code 200 or 201)
    if (response.statusCode == 200 || response.statusCode == 201) {
      return data;
    } else {
      // Throw an exception if the request was not successful, including error details
      throw Exception(data['errors'][0]['detail']);
    }
  } catch (e) {
    // Throw an exception if an error occurs during the request
    throw Exception(e);
  }
}

/// Function for making GET requests
Future<Map<String, dynamic>> sendGetRequest({
  required String endPoint,
  required String? publishableKey,
  required String? privateKey,
  required bool test,
}) async {
  // Construct the complete URL for the GET request
  String url = "${activeHost(test: test)}/api/v1/$endPoint";

  try {
    // Make the HTTP GET request
    http.Response response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'INTASEND_PUBLIC_API_KEY': publishableKey!,
        'Authorization': 'Bearer $privateKey',
      },
    );

    // Decode the response body into a Map
    Map<String, dynamic> data = jsonDecode(response.body);

    // Check if the request was successful (status code 200 or 201)
    if (response.statusCode == 200 || response.statusCode == 201) {
      return data;
    } else {
      // Throw an exception if the request was not successful, including error details
      throw Exception(data['errors'][0]['detail']);
    }
  } catch (e) {
    // Throw an exception if an error occurs during the request
    throw Exception(e);
  }
}

Future<Map<String, dynamic>> sendMoney({
  required bool test,
  required String provider,
  required Currency currency,
  required List transactions,
  required String callbackUrl,
  required String walletId,
}) async {
  final Map<String, dynamic> payload = {
    'provider': provider,
    'transactions': transactions,
    'currency': enumStringCurrency(currency: currency),
    'callback_url': callbackUrl,
    'wallet_id': walletId,
  };
  return await sendPostRequest(
    endPoint: "send-money/initiate/",
    payload: payload,
    test: test,
    publishableKey: Intasend.keys.publishableKey,
    privateKey: Intasend.keys.privateKey,
  );
}

// List of bank codes with corresponding names
List<Map<String, dynamic>> bankCodes = [
  {"bank_name": "KCB", "bank_code": "1"},
  {"bank_name": "Standard Chartered Bank KE", "bank_code": "2"},
  {"bank_name": "Mayfair Bank Limited", "bank_code": "65"}
];
