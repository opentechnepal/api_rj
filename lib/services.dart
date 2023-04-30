import 'dart:convert';
import 'package:api_demo_rj/userModel.dart';
import 'package:http/http.dart' as http;

class GetApiData{
  final apiLink = 'https://jsonplaceholder.typicode.com/users';
  //final paredData = json.decode(apiLink);

  Future getData() async {
    final response = await http.get(Uri.parse(apiLink));
    final List<UserModel> users = userModelFromJson(response.body);
    if (response.statusCode == 200){
       return users;
    } else {
      return null;
    }
   

  }
}