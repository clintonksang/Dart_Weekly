import 'dart:convert';

import 'package:http/http.dart';
import 'package:week4_streams/Models/user_model.dart';

class ContactsService {
  Future getFollowers() async {
    var result;
    String? url = 'https://jsonplaceholder.typicode.com/users';

    final response = await get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      // 'Authorization': 'JWT ${token}',
    });

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);

      List<dynamic> contacts =
          responseData.map((json) => ContactsModel.fromJson(json)).toList();
      return responseData;
    }
    if (response.statusCode == 403) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      return responseData;
    } else {
      print(response.body);
      throw Exception('Unable to fetch profile details from the API');
    }
  }
}

// void main() async {
//   List result = await ContactsService().getFollowers();
//   print(result);
// }
