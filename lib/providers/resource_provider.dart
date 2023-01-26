// import 'dart:convert';

import 'package:flutter/foundation.dart';
// import 'package:http/http.dart' as http;

class Resource with ChangeNotifier {
  final String resource;
  List<dynamic> _records = [];

  List<dynamic> get orders {
    return [..._records];
  }

  Resource({required this.resource});

  Future<void> fetchAndSetRecords() async {
    final getResourceRecordsUrl = Uri.https('prefix.com/$resource/list');

    _records = [];

    return print(getResourceRecordsUrl);

    // try {
    //   final response = await http.get(getResourceRecordsUrl);

    //   final List<dynamic> loadedRecords = [];
    //   final extractedData = json.decode(response.body) as Map<String, dynamic>;

    //   notifyListeners();
    // } catch (error) {
    //   throw error;
    // }
  }
}
