import 'package:calculator/poke_detail_screen.dart';
import 'package:calculator/poke_model.dart';
import 'package:calculator/pokemon_card_widget.dart';
import 'package:flutter/material.dart';

class PokedexScreen extends StatefulWidget {
  const PokedexScreen({super.key});

  @override
  State<PokedexScreen> createState() => _PokedexScreenState();
}

class _PokedexScreenState extends State<PokedexScreen> {


  @override
  Widget build(BuildContext context) {
    final listPoke = getListPokemon();
    return SafeArea(child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.catching_pokemon, size: 40),
                SizedBox(width: 16),
                Text(
                  'Pokédex', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
                ),
                Spacer(),
                Icon(Icons.arrow_downward, size: 40),
              ],
            ),
            SizedBox(height: 16,),
            Expanded(
              child: GridView.builder(itemBuilder: (context,index){
                final item = listPoke[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => PokeDetailScreen(model: item),
                    ),
                    );
                  },
                    child: PokemonCardWidget(pokeModel: item,));
              },
              itemCount: listPoke.length, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
