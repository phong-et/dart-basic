  
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;
  Future<dynamic> login(url) async {
    try {
      final response = await http
          .get(url);
      if (response.statusCode == 200) {
        // If server returns an OK response, parse the JSON
        return JSON.jsonDecode((response.body));
      } else {
        // If that response was not OK, throw an error.
        print('Failed to load post');
      }
    } catch (e) {
      print(e);
    }
  }
void main() async{
  print(await login('http://210.245.84.27:8045/Login/Login?username=user1&password=123'));
}