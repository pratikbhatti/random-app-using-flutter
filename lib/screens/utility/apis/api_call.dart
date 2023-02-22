import 'dart:convert';

import 'package:demo39/screens/random_user/modal/random_user_modal.dart';
import 'package:http/http.dart' as http;

class ApiCall {
  Future<RandomModal?> getData() async {
    String api_link = "https://randomuser.me/api/";

    var response = await http.get(
      Uri.parse(api_link),
    );
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);

      print("=====================");
      var data = RandomModal.fromJson(json);
      print("================= $data");

      return data;
    } else {
      return null;
    }
  }
}
