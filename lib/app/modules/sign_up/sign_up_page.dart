import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../../shared/components/custom_input_field.dart';
import '../../shared/components/state_button.dart';
import 'sign_up_rx_controller.dart';

class SignUpPage extends StatefulWidget {
  final String title;
  const SignUpPage({Key key, this.title = "SignUp"}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends ModularState<SignUpPage, SignUpRxController> {
  FocusNode _nameFocusNode;
  FocusNode _emailFocusNode;
  FocusNode _passwordFocusNode;
  FocusNode _confirmPasswordFocusNode;

  @override
  void initState() {
    _nameFocusNode = FocusNode();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _confirmPasswordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Colors.red;
    Color secondaryColor = Colors.white;

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: Text(
          "Create Account",
          style: TextStyle(color: secondaryColor, fontSize: 20),
        ),
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: secondaryColor),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Image.asset(
                    "assets/ash.png",
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 16),
                  CustomInputField(
                    focusNode: _nameFocusNode,
                    hintText: " Name",
                    onChanged: controller.rxStore.setName,
                    onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_emailFocusNode),
                    validator: (v) => controller.rxValidators.validateName(),
                    textInputAction: TextInputAction.next,
                    prefixIcon: Icon(MdiIcons.account),
                  ),
                  SizedBox(height: 16),
                  CustomInputField(
                    focusNode: _emailFocusNode,
                    hintText: " E-mail",
                    onChanged: controller.rxStore.setEmail,
                    isEmailField: true,
                    onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_passwordFocusNode),
                    validator: (v) => controller.rxValidators.validateEmail(),
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(height: 16),
                  CustomInputField(
                    focusNode: _passwordFocusNode,
                    hintText: " Password",
                    onChanged: controller.rxStore.setPassword,
                    isPasswordField: true,
                    onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_confirmPasswordFocusNode),
                    validator: (v) => controller.rxValidators.validatePassword(),
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(height: 16),
                  CustomInputField(
                    focusNode: _confirmPasswordFocusNode,
                    hintText: " Confirm Password",
                    onChanged: controller.rxStore.setConfirmPassword,
                    isPasswordField: true,
                    onFieldSubmitted: (_) => controller.createUser(),
                    validator: (v) => controller.rxValidators.validateConfirmPassword(),
                    textInputAction: TextInputAction.done,
                  ),
                  SizedBox(height: 16),
                  RxBuilder(
                    builder: (_) {
                      return StateButton(
                        subState: controller.rxStore.subState,
                        onTap: controller.createUser,
                        secondaryColor: Colors.red,
                        primaryColor: Colors.white,
                        textLabel: Text(
                          "CREATE",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
