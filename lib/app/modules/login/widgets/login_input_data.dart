import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../../../utils/components/login_signup_button.dart';
import '../login_controller.dart';

class LoginInputData extends StatefulWidget {
  final LoginController controller;

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
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                TextFormField(
                  onChanged: widget.controller.rxStore.setEmail,
                  focusNode: _emailNode,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_passwordNode),
                  cursorColor: Colors.yellow,
                  style: TextStyle(color: Colors.black),
                  keyboardType: TextInputType.emailAddress,
                  validator: (v) => widget.controller.rxValidators.validateEmail(),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    fillColor: Colors.transparent,
                    border: InputBorder.none,
                    prefixIcon: Icon(MdiIcons.emailOutline),
                    hintText: "E-mail",
                  ),
                ),
                SizedBox(height: 16),
                RxBuilder(
                  builder: (_) {
                    return TextFormField(
                      onChanged: widget.controller.rxStore.setPassword,
                      focusNode: _passwordNode,
                      onFieldSubmitted: (_) => widget.controller.signIn(),
                      cursorColor: Colors.black,
                      obscureText: !widget.controller.rxStore.showPassword,
                      style: TextStyle(color: Colors.black),
                      validator: (v) => widget.controller.rxValidators.validatePassword(),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        fillColor: Colors.transparent,
                        prefixIcon: Icon(
                          MdiIcons.lockOutline,
                        ),
                        hintText: "Password",
                        errorMaxLines: 3,
                        suffixIcon: InkWell(
                          onTap: widget.controller.rxStore.changeVisibility,
                          child: Icon(
                            widget.controller.rxStore.showPassword ? MdiIcons.eyeOutline : MdiIcons.eyeOffOutline,
                          ),
                        ),
                      ),
                    );
                  },
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
                          checkColor: Colors.black,
                        );
                      },
                    ),
                    Text(
                      'Remember-me',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
                LoginSignUpButton(
                  subState: widget.controller.rxStore.subState,
                  firstLabel: "LOGIN",
                  secondLabel: "REGISTER",
                  firstOnTap: () => widget.controller.signIn(),
                  secondOnTap: () => Modular.to.pushNamed("/signup"),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
