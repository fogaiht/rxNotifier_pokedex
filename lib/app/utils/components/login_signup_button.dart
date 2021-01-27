import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../sub_states.dart';
import 'state_button.dart';

class LoginSignUpButton extends StatelessWidget {
  final SubState subState;
  final String firstLabel;
  final String secondLabel;
  final Function firstOnTap;
  final Function secondOnTap;

  const LoginSignUpButton(
     {
    Key key,
    @required this.subState,
    @required this.firstLabel,
    @required this.secondLabel,
    @required this.firstOnTap,
    @required this.secondOnTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Observer(
        builder: (_) {
          return Column(
            children: <Widget>[
              StateButton(
                subState: subState,
                secondaryColor: Colors.red,
                primaryColor: Colors.white,
                textLabel: Text(
                  firstLabel,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                onTap: firstOnTap,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                child: Row(
                  children: [
                    Flexible(child: Divider(color: Colors.white, thickness: 1.0)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32.0),
                      child: Text(
                        "or",
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
                subState: subState,
                secondaryColor: Colors.red,
                primaryColor: Colors.red,
                borderColor: Colors.white,
                textLabel: Text(
                  secondLabel,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onTap: secondOnTap,
              ),
              SizedBox(height: 32.0)
            ],
          );
        },
      ),
    );
  }
}
