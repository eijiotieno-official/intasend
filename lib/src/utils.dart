String host = "https://payment.intasend.com";
String testHost = "https://sandbox.intasend.com";

String activeHost({required bool test}) => test ? testHost : host;

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
