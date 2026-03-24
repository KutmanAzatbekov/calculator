import 'package:calculator/calculator_screen.dart';
import 'package:calculator/counter/bloc/counter_bloc.dart';
import 'package:calculator/counter/counter_screen.dart';
import 'package:calculator/di/injectable_module.dart';
import 'package:calculator/harry/harry_screen.dart';
import 'package:calculator/naruto/naruto_model/naruto_model.dart';
import 'package:calculator/naruto/naruto_screen.dart';
import 'package:calculator/pokedex_screen.dart';
import 'package:calculator/quiz/cubit/quiz_cubit.dart';
import 'package:calculator/quiz/quiz_screen.dart';
import 'package:calculator/rick/rick_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main() async{
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NarutoModelAdapter());
  runApp(BlocProvider(create: (context) => QuizCubit(), child: const MaterialApp(home: RickScreen(),),));
}

