import 'package:calculator/harry/harry_screen.dart';
import 'package:calculator/naruto/naruto_model/naruto_model.dart';
import 'package:calculator/naruto/naruto_screen.dart';
import 'package:calculator/pokedex_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NarutoModelAdapter());
  runApp(const MaterialApp(home: NarutoScreen()));
}

