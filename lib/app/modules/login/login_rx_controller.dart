import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/models/login_model.dart';
import '../../utils/custom_shared_preferences.dart';
import '../../utils/sub_states.dart';
import 'login_repository.dart';
import 'login_rx_store.dart';
import 'login_rx_validator.dart';

class LoginRxController {
  final LoginRepository _loginRepository;
  final LoginRxStore rxStore;
  final LoginRxValidator rxValidators;

  LoginRxController(this._loginRepository, this.rxValidators, this.rxStore);

  final CustomSharedPrefs prefs = CustomSharedPrefs();

  signIn() async {
    LoginModel model = LoginModel(email: rxStore.email, password: rxStore.password);

    print(rxStore.email);
    print(rxStore.password);
    prefs.save("userData", model);
    prefs.save("userEmail", model.email);

    try {
      rxStore.setSubState(SubState.loading);
      var response = await _loginRepository.signIn(model);
      if (response != null) {
        rxStore.setSubState(SubState.success);
        await Future.delayed(Duration(milliseconds: 1500));
        Modular.to.pushReplacementNamed("/home");
      }
    } catch (e) {
      print(e);
      rxStore.setSubState(SubState.error);
      await Future.delayed(Duration(milliseconds: 1500));
      rxStore.setSubState(SubState.start);
    }
  }
}
