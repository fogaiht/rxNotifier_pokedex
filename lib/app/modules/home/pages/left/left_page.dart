import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'package:super_qr_reader/super_qr_reader.dart';

import '../../home_rx_controller.dart';
import 'components/left_joint.dart';
import 'components/pokedex_bottom.dart';
import 'components/pokedex_header.dart';
import 'components/pokedex_screen.dart';

class LeftPage extends StatefulWidget {
  final HomeRxController rxController;

  final PageController pageController;

  const LeftPage({
    Key key,
    @required this.pageController,
    @required this.rxController,
  }) : super(key: key);

  @override
  _LeftPageState createState() => _LeftPageState();
}

class _LeftPageState extends State<LeftPage> {
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
                  child: RxBuilder(
                    builder: (_) {
                      return PokedexScreen(
                        pokemonList: widget.rxController.store.user.pokemonList,
                        selectedPokemonIndex: widget.rxController.store.screenIndex,
                        selectedPokemon: widget.rxController.store.selectedPokemon,
                        pokemonURL: widget.rxController.store.currentURL,
                      );
                    },
                  ),
                ),
                PokedexBottom(
                  onLeftTap: widget.rxController.decrement,
                  onRightTap: widget.rxController.increment,
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
                      widget.rxController.addPokemon(results);
                    }
                  },
                  selectPokemon: () {
                    var pokemonIndex = widget.rxController.store.screenIndex;
                    var userPokemonList = widget.rxController.store.user.pokemonList;
                    if (pokemonIndex >= 0) {
                      widget.rxController.store.setSelectedPokemon(userPokemonList[pokemonIndex]);
                      print(widget.rxController.store.selectedPokemon);
                      widget.pageController.animateToPage(
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
