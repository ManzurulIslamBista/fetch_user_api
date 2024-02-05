import 'dart:convert';

import 'package:fetch_api/model/Users.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class FetchApiProvider extends ChangeNotifier {
  List<Users> usersList = [];

  void fetchApi() async {
    const url = 'https://jsonplaceholder.typicode.com/users';
    var uri = Uri.parse(url);

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        usersList.clear();
        for (var jsonUser in jsonData) {
          Users user = Users.fromJson(jsonUser);
          usersList.add(user);
        }
        notifyListeners();
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }
}
