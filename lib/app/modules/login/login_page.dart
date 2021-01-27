import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'login_controller.dart';
import 'widgets/login_input_data/login_input_data.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  

  @override
  Widget build(BuildContext context) {
    double _heightSize = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.red,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: _heightSize,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Spacer(flex: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Pokedex",
                      style: TextStyle(
                        fontSize: 55,
                        fontFamily: "Pokemon",
                        color: Colors.yellow,
                      ),
                    ),
                  ],
                ),
                Spacer(),
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
