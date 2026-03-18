import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:calculator/data/hive_helper.dart';
import 'package:calculator/di/injectable_module.dart';
import 'package:calculator/naruto/bloc/naruto_bloc.dart';
import 'package:calculator/naruto/naruto_model/naruto_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NarutoScreen extends StatefulWidget {
  const NarutoScreen({super.key});

  @override
  State<NarutoScreen> createState() => _NarutoScreenState();
}

class _NarutoScreenState extends State<NarutoScreen> {
  final cubit = getIt<NarutoBloc>();

  @override
  void initState() {
    super.initState();
    cubit.add(GetCharactersEvent());
    cubit.add(GetLocalCharactersEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: BlocBuilder<NarutoBloc, NarutoState>(
        bloc: cubit,
        builder: (context, state) {
          if(state.error != null){
            return Center(child: Text(state.error!),);
          }
          if(state.list != null) {
            final listNarutoValue = state.list;
            return ListView.builder(itemBuilder: (context, index) {
              final item = listNarutoValue[index];
              return Column(
                children: [
                  Text(item.name),
                  item.images.isNotEmpty ?
                  CachedNetworkImage(
                      imageUrl:item.images[0],
                    placeholder: (context, url) =>
                    CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    fit: BoxFit.cover,
                  ) : const Icon(
                      Icons.no_photography
                  ),
                ],
              );
            },
              itemCount: listNarutoValue!.length,
            );
          }
          return Center(child: CircularProgressIndicator(),);
        },
      ),
    ));
  }


}
