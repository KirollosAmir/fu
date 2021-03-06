import 'package:fungicide_utilizer_app/DataLayer/land.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class MyLandsRepos {
  // ignore: missing_return
  Future<List<LandModel>> fetchLands() async {
    List<LandModel> lands = [];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String _id = prefs.getString('ID');
    print(_id);
    var response = await http.get(
        'https://fungicidesutilizer.000webhostapp.com/APIs/getlands.php?id=' +
            _id);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      data.map((land) => lands.add(LandModel.fromJson(land))).toList();
      return lands;
    }
  }

  Future addLands(String landname, String crop, String postalcode,
      String stationserial) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String _id = prefs.getString('ID');

    var url = Uri.parse(
        'https://fungicidesutilizer.000webhostapp.com/APIs/addland.php?farmerid=' +
            _id +
            '&title=' +
            landname +
            '&crop=' +
            crop +
            '&postalCode=' +
            postalcode +
            '&station=' +
            stationserial);

    var response = await http.get(url);
    if (response.statusCode == 200) {
      if (response.body == "error") {
        return "Error Adding Land.";
      } else {
        return "Land Added Successfully. ";
      }
    } else {
      return "Connection Error.";
    }
  }
}
