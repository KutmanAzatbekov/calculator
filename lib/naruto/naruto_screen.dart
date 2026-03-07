import 'dart:math';

import 'package:calculator/naruto/naruto_model/naruto_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class NarutoScreen extends StatefulWidget {
  const NarutoScreen({super.key});

  @override
  State<NarutoScreen> createState() => _NarutoScreenState();
}

class _NarutoScreenState extends State<NarutoScreen> {
  final listNaruto = ValueNotifier<List<NarutoModel>>([]);

  @override
  void initState(){
    super.initState();
    getHttp();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: ValueListenableBuilder(valueListenable: listNaruto, builder: (_, listNarutoValue, __) =>
      ListView.builder(itemBuilder: (context, index){
        final item = listNarutoValue[index];
        return Column(
          children: [
            Text(item.name),
            item.images.isNotEmpty ?
            Image.network(item.images[0]): const Icon(Icons.no_photography),
          ],
        );
      },
        itemCount: listNarutoValue.length,
      )
      ),
    ));
  }

  Future<List<NarutoModel>> getHttp() async{
    final dio = Dio();
    final response = await dio.get('https://dattebayo-api.onrender.com/characters');
    final List<dynamic> data = response.data['characters'];
    final List<NarutoModel> list = data.map((e) => NarutoModel.fromJson(e)).toList();
    listNaruto.value= list;
    return list;
  }

}
