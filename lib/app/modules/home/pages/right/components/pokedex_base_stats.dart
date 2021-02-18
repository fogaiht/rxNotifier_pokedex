import 'package:flutter/material.dart';

import '../../../../../shared/models/pokemon_model.dart';
import 'base_stats_row.dart';

class PokedexBaseStats extends StatefulWidget {
  final PokemonModel selectedPokemon;

  const PokedexBaseStats({Key key, @required this.selectedPokemon}) : super(key: key);
  @override
  _PokedexBaseStatsState createState() => _PokedexBaseStatsState();
}

class _PokedexBaseStatsState extends State<PokedexBaseStats> {
  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width * 0.9;
    double heightSize = MediaQuery.of(context).size.height * 0.9;
    print(widget.selectedPokemon.stats);
    return Container(
      height: heightSize * 0.35,
      width: widthSize,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: widthSize * 0.9,
                child: Text(
                  "Base Stats",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: heightSize * 0.03,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: heightSize * 0.025),
          ...widget.selectedPokemon.stats.map(
            (e) => BaseStatsRow(
              label: e.stat.name.contains("Special-") ? e.stat.name.replaceAll("Special-", "Sp ") : e.stat.name,
              statValue: e.baseStat,
            ),
          ),
        ],
      ),
    );
  }
}
