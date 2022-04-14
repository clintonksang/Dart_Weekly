import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AppState extends ChangeNotifier {
  String ? _displaytext;
String ? get getdisplaytext => _displaytext;

  void setDisplayText (String newText) {
    _displaytext = newText;
    notifyListeners();
  }


// from network
String _dataUrl = "https://reqres.in/api/users?per_page=20";
 var _jsonResonse = "";
bool _isFetching = false;
String get getJsonResonseText => _jsonResonse;
List<dynamic> getResponseJson() {
 if (_jsonResonse.isNotEmpty) {
 Map<String, dynamic> json = jsonDecode(_jsonResonse);
 return json['data'];
 }
 return [];
}

bool get isFetching => _isFetching;

  Future<void> fetchData() async {
 _isFetching = true;
 notifyListeners();

 var response = await http.get(Uri.parse(_dataUrl));
 if (response.statusCode == 200) {
 _jsonResonse = response.body;
 }

 _isFetching = false;
 notifyListeners();
}
}
