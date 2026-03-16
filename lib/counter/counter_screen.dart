import 'package:calculator/counter/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CounterBloc>().add(LoadCounterEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        return SafeArea(
            child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${state.count}',
                  style: TextStyle(fontSize: 40),
                ),
                GestureDetector(
                  onTapDown: (_) =>
                  context.read<CounterBloc>().add(StartIncrementingEvent()),
                  onTapUp: (_) {
                    context.read<CounterBloc>().add(StopIncrementingEvent());
                  },
                  onTapCancel: (){
                    context.read<CounterBloc>().add(StopIncrementingEvent());
                  },
                  child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(color: Colors.grey),
                      child: Text(
                        '+',
                        style: TextStyle(fontSize: 50),
                      )),
                )
              ],
            ),
          ),
        ));
      },
    );
  }
}
