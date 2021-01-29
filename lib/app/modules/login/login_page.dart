import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'login_rx_controller.dart';
import '../../shared/components/fogaihtdev_image.dart';
import 'widgets/login_input_data.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginRxController> {
  @override
  Widget build(BuildContext context) {
    double _heightSize = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.red,
      body: SingleChildScrollView(
        // physics: NeverScrollableScrollPhysics(),
        child: SafeArea(
          child: Container(
            height: _heightSize,
            decoration: BoxDecoration(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Spacer(flex: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome\nto",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 55,
                        fontFamily: "Pokemon",
                        color: Colors.yellow,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Pokeflutterdex",
                      style: TextStyle(
                        fontSize: 55,
                        fontFamily: "Pokemon",
                        color: Colors.yellow,
                      ),
                    ),
                  ],
                ),
                Hero(tag: "FogaihtDevImage", child: FogaihtDevImage()),
                LoginInputData(controller),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
