import 'package:cached_network_image/cached_network_image.dart';
import 'package:calculator/di/injectable_module.dart';
import 'package:calculator/rick/cubit/rick_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RickScreen extends StatefulWidget {
  const RickScreen({super.key});

  @override
  State<RickScreen> createState() => _RickScreenState();
}

class _RickScreenState extends State<RickScreen> {
  final cubit = getIt<RickCubit>()..getRick();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        cubit.getNextPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: BlocBuilder<RickCubit, RickState>(
        bloc: cubit,
        builder: (context, state) {
          final list = state.list ?? [];
          return ListView.builder(
            controller: _scrollController,
            itemCount: list.length + (state.isPaginationLoading ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == list.length) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Colors.green,
                    ),
                  ),
                );
              }
              final item = list[index];
              return Column(
                children: [
                  Text(
                    item.name,
                    style: TextStyle(fontSize: 30),
                  ),
                  CachedNetworkImage(imageUrl: item.image),
                ],
              );
            },
          );
        },
      ),
    ));
  }
}
