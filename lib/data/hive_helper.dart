import 'dart:convert';

import 'package:calculator/naruto/naruto_model/naruto_model.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable()
class HiveHelper {
  static const String boxName = 'naruto_box';
  static const String counterKey = 'counter_value';

  Future<void> saveCount(int count) async{
    var box = await Hive.openBox('settings');
    await box.put(counterKey, count);
  }

  Future<int> getCounter() async{
    var box = await Hive.openBox('settings');
    return box.get(counterKey, defaultValue: 0);
  }

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