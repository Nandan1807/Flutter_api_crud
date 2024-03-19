import 'package:api_crud/modelclass.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FoodItems {
  String baseUrl = "https://65e14cf1d3db23f7624aba68.mockapi.io/fooditems";

  Future<List<ApiModel>> getAllDetail() async {
    var res = await http.get(Uri.parse(baseUrl));
    List<ApiModel> itemList = <ApiModel>[];
    List<dynamic> data = jsonDecode(res.body);
    for(int i=0;i<data.length;i++){
      ApiModel item = ApiModel();
      item.id = data[i]['id'];
      item.name = data[i]['itemName'];
      item.image = data[i]['itemImg'];
      item.description = data[i]['itemDes'];
      itemList.add(item);
    }
    return itemList;
  }

  Future<ApiModel> getDetailById(String id) async {
    var res = await http.get(Uri.parse(baseUrl + "/" + id));
    Map<dynamic,dynamic> data = jsonDecode(res.body);
    ApiModel item = ApiModel();
    item.id = data['id'];
    item.name = data['itemName'];
    item.image = data['itemImg'];
    item.description = data['itemDes'];
    return item;
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
