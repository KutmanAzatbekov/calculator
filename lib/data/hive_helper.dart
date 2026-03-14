import 'dart:convert';

import 'package:calculator/naruto/naruto_model/naruto_model.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HiveHelper {
  static const String boxName = 'naruto_box';

  Future<void> saveList(List<NarutoModel> items) async{
    var box = await Hive.openBox<NarutoModel>(boxName);
    await box.clear();
    await box.addAll(items);
  }

  Future<List<NarutoModel>> loadList() async {
    var box = await Hive.openBox<NarutoModel>(boxName);
    return box.values.toList();
  }

    String encodeItems(List<NarutoModel> items) => json.encode(
      items.map<Map<String, dynamic>>((item) => item.toJson()).toList(),
    );

    List<NarutoModel> decodeItems(String itemsString) => (json.decode(itemsString) as List)
    .map<NarutoModel>((item) => NarutoModel.fromJson(item)).toList();


}