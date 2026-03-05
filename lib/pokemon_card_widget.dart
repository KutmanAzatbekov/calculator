import 'package:calculator/poke_model.dart';
import 'package:flutter/material.dart';

class PokemonCardWidget extends StatefulWidget {

  final PokeModel pokeModel;

  const PokemonCardWidget({super.key, required this.pokeModel});

  @override
  State<PokemonCardWidget> createState() => _PokemonCardWidgetState();
}

class _PokemonCardWidgetState extends State<PokemonCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        border: Border.all(color: widget.pokeModel.color, width: 4),
        borderRadius: BorderRadius.circular(16),

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.pokeModel.number, style: TextStyle(color: widget.pokeModel.color)),
          ),
          Center(
            child: Image.network(
              widget.pokeModel.url,
              height: 30,
            ),
          ),
          Spacer(),
          Container(
            decoration: BoxDecoration(color: widget.pokeModel.color),
            width: MediaQuery.of(context).size.width,
            child: Text(
              widget.pokeModel.name,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
