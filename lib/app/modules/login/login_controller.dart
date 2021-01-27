import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../shared/models/login_model.dart';
import '../../utils/custom_shared_preferences.dart';
import '../../utils/sub_states.dart';
import 'login_repository.dart';
import 'login_rx_store.dart';
import 'login_rx_validator.dart';
import 'login_store.dart';
import 'login_validator.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final LoginRepository _loginRepository;
  final LoginValidator validators;
  final LoginRxValidator rxValidators;
  final LoginStore store;
  final LoginRxStore rxStore;

  _LoginControllerBase(this._loginRepository, this.validators, this.store, this.rxStore, this.rxValidators);

  final CustomSharedPrefs prefs = CustomSharedPrefs();

  @action
  signIn() async {
    LoginModel model = LoginModel(email: store.email, password: store.password);

    print(store.email);
    print(store.password);
    prefs.save("userData", model);
    prefs.save("userEmail", model.email);

    try {
      store.subState = SubState.loading;
      var response = await _loginRepository.signIn(model);
      if (response != null) {
        store.subState = SubState.success;
        await Future.delayed(Duration(milliseconds:1500));
        Modular.to.pushReplacementNamed("/home");
      }
    } catch (e) {
      print(e);
      store.subState = SubState.error;
    }
  }
}
