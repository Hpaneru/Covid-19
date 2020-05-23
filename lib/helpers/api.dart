import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiHelper {
  Future<List> allCountry() async {
    http.Response response = await http.get(
        Uri.encodeFull("https://api.covid19api.com/summary"),
        headers: {"Accept": "application/json"});
    return json.decode(response.body)["Countries"];
  }

  Future<List> nepalSummary() async {
    http.Response response = await http.get(
        Uri.encodeFull("https://nepalcorona.info/api/v1/data/nepal"),
        headers: {"Accept": "application/json"});
    var nepaldata = json.decode(response.body);
    return [nepaldata];
  }

  Future<List> globalSummary() async {
    http.Response response = await http.get(
        Uri.encodeFull("https://brp.com.np/covid/alldata.php"),
        headers: {"Accept": "application/json"});
    var globaldata = json.decode(response.body);
    return [globaldata];
  }
}
