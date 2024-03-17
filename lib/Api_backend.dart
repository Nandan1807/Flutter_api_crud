import 'package:api_crud/modelclass.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FoodItems {
  String baseUrl = "Api_url_here";

  Future<List> getAllDetail() async {
    var res = await http.get(Uri.parse(baseUrl));
    return jsonDecode(res.body);
  }

  Future<List> getDetailById(String id) async {
    var res = await http.get(Uri.parse(baseUrl + "/" + id));
    return jsonDecode(res.body);
  }

  Future<void> deleteDetail(String id) async {
    var res = await http.delete(Uri.parse(baseUrl + "/" + id));
  }

  Future<void> insert(String name, String image, String des) async {
    ApiModel item = ApiModel();
    item.name = name;
    item.image = image;
    item.description = des;

    var res = await http.post(Uri.parse(baseUrl), body: item.mapConvert());
  }

  Future<void> update(String id, String name, String image, String des) async {
    ApiModel item = ApiModel();
    item.name = name;
    item.image = image;
    item.description = des;

    var res =
        await http.put(Uri.parse(baseUrl + "/" + id), body: item.mapConvert());
  }
}
