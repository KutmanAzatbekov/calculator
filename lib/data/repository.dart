import 'package:calculator/naruto/naruto_model/naruto_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class Repository {
Future<List<NarutoModel>> getHttp() async{
  final dio = Dio();
  final response = await dio.get('https://dattebayo-api.onrender.com/characters');
  final List<dynamic> data = response.data['characters'];
  final List<NarutoModel> list = data.map((e) => NarutoModel.fromJson(e)).toList();
  return list;
}
}