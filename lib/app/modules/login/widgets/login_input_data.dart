import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:rx_notifier/rx_notifier.dart';

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
                  cursorHeight: 25.0,
                  cursorWidth: 2.5,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  keyboardType: TextInputType.emailAddress,
                  validator: (v) => widget.controller.rxValidators.validateEmail(),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    fillColor: Colors.transparent,
                    border: InputBorder.none,
                    prefixIcon: Icon(MdiIcons.emailOutline),
                    hintText: " E-mail",
                    hintStyle: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                SizedBox(height: 16),
                RxBuilder(
                  builder: (_) {
                    return TextFormField(
                      onChanged: widget.controller.rxStore.setPassword,
                      focusNode: _passwordNode,
                      onFieldSubmitted: (_) => widget.controller.signIn(),
                      cursorColor: Colors.yellow,
                      cursorHeight: 25.0,
                      cursorWidth: 2.5,
                      obscureText: !widget.controller.rxStore.showPassword,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      validator: (v) => widget.controller.rxValidators.validatePassword(),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        fillColor: Colors.transparent,
                        prefixIcon: Icon(MdiIcons.lockOutline),
                        hintText: " Password",
                        hintStyle: TextStyle(color: Colors.white, fontSize: 20),
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
          ),
        )
      ],
    );
  }
}
