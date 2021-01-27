import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../utils/components/state_button.dart';
import '../login_controller.dart';

class LoginButton extends StatelessWidget {
  final LoginController controller;

  const LoginButton(this.controller, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Observer(
        builder: (_) {
          return Column(
            children: <Widget>[
              StateButton(
                subState: controller.store.subState,
                secondaryColor: Colors.red,
                primaryColor: Colors.white,
                textLabel: Text(
                  "LOGIN",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                onTap: controller.signIn,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                child: Row(
                  children: [
                    Flexible(child: Divider(color: Colors.white, thickness: 1.0)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32.0),
                      child: Text(
                        "ou",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Flexible(child: Divider(color: Colors.white, thickness: 1.0)),
                  ],
                ),
              ),
              StateButton(
                subState: controller.store.subState,
                secondaryColor: Colors.red,
                primaryColor: Colors.red,
                borderColor: Colors.white,
                textLabel: Text(
                  "REGISTRAR",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onTap: () => Modular.to.pushNamed("/signup"),
              ),
              SizedBox(height: 32.0)
            ],
          );
        },
      ),
    );
  }
}
