

import 'dart:ui';

import 'package:flutter/material.dart';

class PokeModel {
  final String name;
  final String number;
  final String url;
  final Color color;
  final List<String> types;
  final String weight;
  final String height;
  final String moves;
  final String description;
  final Map<String, double> stats;

  PokeModel({required this.name, required this.number, required this.url, required this.color, required this.types, required this.weight, required this.height, required this.moves, required this.description, required this.stats});
}

List<PokeModel> getListPokemon(){
  final bulbaUrl = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwAqp4dI-kYjBsYCdY-YqvSHZ4N6vFXk3O0w&s';
  final charma = 'https://upload.wikimedia.org/wikipedia/en/5/56/Charmander.png';
  final squirtle = 'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/detail/007.png';
  final Butterfree = 'https://img.pokemondb.net/artwork/large/butterfree.jpg';
  final Pikachu = 'https://upload.wikimedia.org/wikipedia/en/a/a6/Pok%C3%A9mon_Pikachu_art.png';
  final Gastly = 'https://img.pokemondb.net/artwork/large/gastly.jpg';
  final Ditto = 'https://img.pokemondb.net/artwork/large/ditto.jpg';
  final Mew = 'https://upload.wikimedia.org/wikipedia/en/4/4b/Pok%C3%A9mon_Mew_art.png';
  final Aron = 'https://img.pokemondb.net/artwork/large/aron.jpg';


  List<PokeModel> pokeList = [
    PokeModel(name: 'Bulbasaur', number: '#001', url: bulbaUrl, color: Colors.green, types: ['Grass', 'Poison'], weight: '6,9 kg', height: '0,7 m',
      moves: 'Chlorophyll\nOvergrow', description: 'There is a plant seed on its back right from the day this Pokémon is born. The seed slowly grows larger.',
    stats: {
      'HP': 0.45,
      'ATK': 0.49,
      'DEF': 0.49,
      'SATK': 0.65,
      'SDEF': 0.65,
      'SPD': 0.45
    }),
    PokeModel(name: 'Charmander', number: '#004', url: charma, color: Colors.orange,types: ['Fire'], weight: '8,5 kg', height: '0,6 m', moves: 'Mega-Punch\nFire-Punch',
        description: 'It has a preference for hot things. When it rains, steam is said to spout from the tip of its tail.',
        stats: {
          'HP': 0.39,
          'ATK': 0.52,
          'DEF': 0.43,
          'SATK': 0.60,
          'SDEF': 0.50,
          'SPD': 0.65
        }),
    PokeModel(name: 'Squirtle', number: '#007', url: squirtle, color: Colors.blueAccent,types: ['Water'], weight: '9.0 kg', height: '0.5 m', moves: 'Torrent\nRain-Dish',
        description: 'When it retracts its long neck into its shell, it squirts out water with vigorous force.',
        stats: {
          'HP': 0.44,
          'ATK': 0.48,
          'DEF': 0.65,
          'SATK': 0.50,
          'SDEF': 0.64,
          'SPD': 0.43
        }),
    PokeModel(name: 'Butterfree', number: '#012', url: Butterfree, color: Colors.lightGreen,types: ['Bug', 'Flying'], weight: '32,0 kg', height: '1,1 m',
        moves: 'Compound-Eyes\nTinted-Lens',
        description: 'In battle, it flaps its wings at great speed to release highly toxic dust into the air.',
        stats: {
          'HP': 0.60,
          'ATK': 0.45,
          'DEF': 0.50,
          'SATK': 0.90,
          'SDEF': 0.80,
          'SPD': 0.70}),
    PokeModel(name: 'Pikachu', number: '#025', url: Pikachu, color: Colors.yellow,types: ['Electric'], weight: '6,0 kg', height: '0,4 m',
        moves: 'Mega-Punch\nPay-Day',
        description: 'Pikachu that can generate powerful electricity have cheek sacs that are extra soft and super stretchy.',
        stats: {
          'HP': 0.35,
          'ATK': 0.55,
          'DEF': 0.40,
          'SATK': 0.50,
          'SDEF': 0.50,
          'SPD': 0.90
        }),
    PokeModel(name: 'Gastly', number: '#092', url: Gastly, color: Colors.purple,types: ['Ghost', 'Type'], weight: '0,1 kg', height: '1,3 m',
        moves: 'Levitate',
        description: 'Born from gases, anyone would faint if engulfed by its gaseous body, which contains poison.',
        stats: {
          'HP': 0.30,
          'ATK': 0.35,
          'DEF': 0.30,
          'SATK': 1.00,
          'SDEF': 0.35,
          'SPD': 0.80
        }),
    PokeModel(name: 'Ditto', number: '#132', url: Ditto, color: Colors.brown,types: ['Normal'], weight: '4,0 kg', height: '0,3 m',
        moves: 'Limber\nImposter',
        description: 'It can reconstitute its entire cellular structure to change into what it sees, but it returns to normal when it relaxes.',
        stats: {
          'HP': 0.48,
          'ATK': 0.48,
          'DEF': 0.48,
          'SATK': 0.48,
          'SDEF': 0.48,
          'SPD': 0.48
        }),
    PokeModel(name: 'Mew', number: '#152', url: Mew, color: Colors.red,types: ['Psychic'], weight: '4,0 kg', height: '0,4 m',
        moves: 'Synchronize',
        description: 'When viewed through a microscope, this Pokémon’s short, fine, delicate hair can be seen.',
        stats: {
          'HP': 1.00,
          'ATK': 1.00,
          'DEF': 1.00,
          'SATK': 1.00,
          'SDEF': 1.00,
          'SPD': 1.00
        }),
    PokeModel(name: 'Aron', number: '#304', url: Aron, color: Colors.grey,types: ['Steel', 'Rock'], weight: '60,0 kg', height: '0,4 m',
        moves: 'Sturdy\nRock-Head',
        description: 'It eats iron ore - and sometimes railroad tracks - to build up the steel armor that protects its body.',
        stats: {
          'HP': 0.50,
          'ATK': 0.70,
          'DEF': 1.00,
          'SATK': 0.40,
          'SDEF': 0.40,
          'SPD': 0.30
        }),
  ];
  return pokeList;
}