import 'package:fungicide_utilizer_app/DataLayer/farmer.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationRepos {
  Farmer f;
  login(String mobile, String password) async {
    var url = Uri.parse(
        'https://fungicidesutilizer.000webhostapp.com/APIs/farmerlogin.php?mobile=' +
            mobile +
            '&password=' +
            password);

    var response = await http.get(url);
    print(response.body);

    if (response.statusCode == 200) {
      if (response.body == "Failed") {
        return "Invalid";
      } else {
        var id = response.body;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs?.setString('ID', id);
        prefs?.setBool("isLoggedIn", true);
        var x = prefs.getString('ID');
        print(x);
        return response.body;
      }
    } else {
      return "Error";
    }

    // String apiurl =
    //     "https://fungicidesutilizer.000webhostapp.com/APIs/farmerlogin.php?";
    // print(mobile);
    // var res = await http.post(Uri.parse(apiurl), body: {
    //   'mobile': '012345678', //get the username text
    //   'password': '123' //get password text
    // });

    // if (response.statusCode == 200) {
    //   return response.body;
    // } else {
    //   return "Error ! ";
    // }

    // var res = http.get(
    //     "https://fungicidesutilizer.000webhostapp.com/APIs/farmerlogin.php?",
    //     headers: {},
    //     body: {"mobile": mobile, "password": password});
    // final data = json.decode(res.body);
  }

  register(String name, String mobile, String password) async {
    var url = Uri.parse(
        'https://fungicidesutilizer.000webhostapp.com/APIs/farmerregister.php?name=' +
            name +
            '&mobile=' +
            mobile +
            '&password=' +
            password);
    var response = await http.get(url);
    print(response.body);
    if (response.statusCode == 200) {
      if (response.body == "success") {
        var id = response.body;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs?.setString('ID', id);
        prefs?.setBool("isLoggedIn", true);
        prefs?.setString('type', 'farmer');
        var x = prefs.getString('ID');
        print(x);
        return response.body;
      }
    } else {
      return "Error";
    }

    // Future<http.Response> createAlbum(String title) {
    //   return http.post(
    //     Uri.parse('https://jsonplaceholder.typicode.com/albums'),
    //     headers: <String, String>{
    //       'Content-Type': 'application/json; charset=UTF-8',
    //     },
    //     body: jsonEncode(<String, String>{
    //       'title': title,
    //     }),
    //   );
    // }
    // Map data = {'name': name, 'mobile': mobile, 'password': password};

    // final response = await http.post(headers: {
    //   "Accept": "application/json",
    //   "Content-Type": "application/x-www-form-urlencoded"
    // }, body: data.toString(), encoding: Encoding.getByName("utf-8"));
  }
}
