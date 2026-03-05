import 'package:calculator/poke_model.dart';
import 'package:flutter/material.dart';

class PokeDetailScreen extends StatefulWidget {
  final PokeModel model;
  const PokeDetailScreen({super.key, required this.model});

  @override
  State<PokeDetailScreen> createState() => _PokeDetailScreenState();
}

class _PokeDetailScreenState extends State<PokeDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: widget.model.color,
          body: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                  child: Icon(Icons.catching_pokemon, size: 300, color: Colors.white.withValues(alpha: 0.2),)),
              Positioned(
                top: 20, left: 10, right: 20,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30,),
                    ),
                    Text(
                        widget.model.name,
                      style: const TextStyle(
                        color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Text(
                        widget.model.number,
                      style: const TextStyle(
                        color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: Column(
                    children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: widget.model.types.map((type) =>
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: widget.model.color,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          type, style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold
                        ),
                        ),
                      )).toList(),
                    ),
                      const SizedBox(height: 10,),
                      Text(
                          'About', style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold, color: widget.model.color,
                      ),
                      ),
                      const SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildInfo(Icons.monitor_weight_outlined, widget.model.weight, 'Weight'),
                          buildInfo(Icons.height, widget.model.height, 'Height'),
                          buildInfo(null, widget.model.moves, 'Moves')
                        ],
                      ),
                      const SizedBox(height: 20,),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          widget.model.description,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Text(
                          'Base Stats',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold, color: widget.model.color
                        ),
                      ),
                      const SizedBox(height: 15,),
                       ...widget.model.stats.entries.map((stat) {
                         return buildStat(stat.key, stat.value);
                       }).toList(),
                  ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, -0.7),
                  child: Image.network(widget.model.url, height: 200,)
              ),
            ],
          ),
        ),
    );
  }

  Widget buildInfo(IconData? icon, String value, String label) {
    return Column(
      children: [
        Row(
          children: [
            if (icon != null)
              Icon(icon, size: 20,),
            const SizedBox(width: 5,),
            Text(
              value, textAlign: TextAlign.center,style: const TextStyle(
                fontWeight: FontWeight.bold
            ),
            ),
          ],
        ),
        const SizedBox(height: 5,),
        Text(
          label, style: const TextStyle(
            color: Colors.grey, fontSize: 12
        ),
        ),
      ],
    );
  }

  Widget buildStat(String label, double value){
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 25),
      child: Row(
        children: [
          SizedBox(
            width: 50,
            child: Text(
              label, style: TextStyle(fontWeight: FontWeight.bold, color: widget.model.color
            ),
          )
          ),
          const SizedBox(width: 10,),
          SizedBox(
            width: 35,
            child: Text((value * 100).toInt().toString().padLeft(3, '0')),
          ),
          const SizedBox(width: 10,),
          Expanded(
              child: LinearProgressIndicator(
                value: value,
                backgroundColor: widget.model.color.withOpacity(0.2),
                valueColor: AlwaysStoppedAnimation<Color>(widget.model.color),
                minHeight: 8,
                borderRadius: BorderRadius.circular(10),
              )
          )
        ],
      ),
    );
  }
}
