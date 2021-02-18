import 'package:flutter/material.dart';
import 'package:super_qr_reader/super_qr_reader.dart';

import 'left/components/left_joint.dart';
import 'left/components/pokedex_bottom.dart';
import 'left/components/pokedex_header.dart';
import 'left/components/pokedex_screen.dart';
import '../home_controller.dart';

class LeftPage extends StatelessWidget {
  final HomeController homeController;

  const LeftPage({Key key, this.homeController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;
    double heightSize1 = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Spacer(),
                PokedexHeader(),
                Center(
                    child: PokedexScreen(
                  homeController: homeController,
                  pokemonList: homeController.store.user.pokemonList,
                  selectedPokemonIndex: homeController.store.screenIndex,
                )),
                PokedexBottom(
                  onLeftTap: homeController.store.decrement,
                  onRightTap: homeController.store.increment,
                  scanQrCode: () async {
                    String results = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ScanView(
                          screenCamSize: Size(widthSize * .83, heightSize1 * .54),
                          positionCam: Size(widthSize * .085, heightSize1 * 0.16),
                          scanWidget: Center(
                            child: ClipPath(
                              clipper: Mask(),
                              child: Container(decoration: BoxDecoration(color: Color(0xff555555))),
                            ),
                          ),
                        ),
                      ),
                    );

                    if (results != null) {
                      homeController.addPokemon(results);
                    }
                  },
                  selectPokemon: () {
                    var pokemonIndex = homeController.store.screenIndex;
                    var userPokemonList = homeController.store.user.pokemonList;
                    if (pokemonIndex >= 0) {
                      homeController.store.selectPokemon(userPokemonList[pokemonIndex]);
                      print(homeController.store.selectedPokemon);
                      homeController.pageController.animateToPage(
                        1,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    }
                  },
                ),
                Spacer(),
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Column(
                children: <Widget>[
                  Spacer(),
                  LeftJoint(),
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
