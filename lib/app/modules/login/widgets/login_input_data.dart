import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../../../shared/components/custom_input_field.dart';
import '../../../shared/components/login_signup_button.dart';
import '../login_rx_controller.dart';

class LoginInputData extends StatefulWidget {
  final LoginRxController controller;

  const LoginInputData(this.controller, {Key key}) : super(key: key);

  @override
  _LoginInputDataState createState() => _LoginInputDataState();
}

class _LoginInputDataState extends State<LoginInputData> {
  final FocusNode _emailNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();

  @override
  void dispose() {
    _emailNode.dispose();
    _passwordNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomInputField(
                focusNode: _emailNode,
                hintText: " Email",
                isEmailField: true,
                onChanged: widget.controller.rxStore.setEmail,
                onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_passwordNode),
                validator: (v) => widget.controller.rxValidators.validateEmail(),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),
              CustomInputField(
                focusNode: _passwordNode,
                hintText: " Password",
                isPasswordField: true,
                onChanged: widget.controller.rxStore.setPassword,
                onFieldSubmitted: (_) => widget.controller.signIn(),
                validator: (v) => widget.controller.rxValidators.validatePassword(),
                textInputAction: TextInputAction.done,
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  RxBuilder(
                    builder: (_) {
                      return Checkbox(
                        value: widget.controller.rxStore.rememberMe,
                        onChanged: widget.controller.rxStore.changeRemember,
                        activeColor: Colors.white,
                        checkColor: Colors.red,
                      );
                    },
                  ),
                  Text('Remember me', style: TextStyle(color: Colors.white, fontSize: 18)),
                ],
              ),
              RxBuilder(
                builder: (_) {
                  return LoginSignUpButton(
                    subState: widget.controller.rxStore.subState,
                    firstLabel: "LOGIN",
                    secondLabel: "REGISTER",
                    firstOnTap: () => widget.controller.signIn(),
                    secondOnTap: () => Modular.to.pushNamed("/signup"),
                  );
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
