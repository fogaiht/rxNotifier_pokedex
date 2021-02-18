import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rx_notifier/rx_notifier.dart';

import 'home_rx_controller.dart';
import 'pages/left/left_page.dart';
import 'pages/right/right_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeRxController> {
  PageController pageController;

  @override
  void initState() {
    controller.getUser();
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RxBuilder(builder: (_) {
      return PageView(
        controller: pageController,
        physics: controller.store.selectedPokemon == null ? NeverScrollableScrollPhysics() : null,
        children: <Widget>[
          LeftPage(pageController: pageController, rxController: controller),
          RightPage(selectedPokemon: controller.store.selectedPokemon, pageController: pageController),
        ],
      );
    });
  }
}
