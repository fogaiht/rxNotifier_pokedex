import 'package:flutter/material.dart';

import '../../../../shared/models/pokemon_model.dart';
import 'components/poke_join_right.dart';
import 'components/pokedex_screen_right.dart';

class RightPage extends StatelessWidget {
  final PokemonModel selectedPokemon;
  final PageController pageController;

  const RightPage({Key key, this.pageController, this.selectedPokemon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: widthSize * 0.315,
              bottom: widthSize * 0.0518,
              child: PokedexScreenRight(selectedPokemon: selectedPokemon),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                children: <Widget>[
                  Spacer(),
                  PokejoinRight(),
                  Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
