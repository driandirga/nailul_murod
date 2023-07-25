import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:convert';

import '../kitab_model.dart';

class KitabApiProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Kitab.fromJson(map);
      if (map is List) return map.map((item) => Kitab.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Kitab?> getKitab(int id) async {
    final response = await get('kitab/$id');
    return response.body;
  }

  Future<Response<Kitab>> postKitab(Kitab kitab) async =>
      await post('kitab', kitab);
  Future<Response> deleteKitab(int id) async => await delete('kitab/$id');
}

class KitabProvider {
  Future<List<Kitab?>> getAllKitab(String title) async {
    //read json file
    final respose = await rootBundle.loadString('assets/data/$title.json');
    //decode json data as list
    final data = json.decode(respose) as List<dynamic>;

    //map json and initialize using DataModel
    return data.map((e) => Kitab.fromJson(e)).toList();
  }
}

class FilterKitab {
  Future<List<Kitab?>> filterList(String title, String filterString) async {
    //read json file
    final respose = await rootBundle.loadString('assets/data/$title.json');
    //decode json data as list
    final data = json.decode(respose) as List<dynamic>;

    //map json and initialize using DataModel
    return data
        .map((e) => Kitab.fromJson(e))
        .where((e) =>
            (e.title!.toLowerCase().contains(filterString.toLowerCase())))
        .toList();
  }
}
