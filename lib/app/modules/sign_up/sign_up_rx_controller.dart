import 'package:flutter_modular/flutter_modular.dart';
import 'package:poke_api/app/utils/sub_states.dart';

import 'sign_up_repository.dart';
import 'sign_up_rx_store.dart';
import 'sign_up_rx_validator.dart';

class SignUpRxController {
  final SignUpRepository _repository;
  final SignUpRxStore rxStore;
  final SignUpRxValidator rxValidators;

  SignUpRxController(this._repository, this.rxStore, this.rxValidators);

  createUser() async {
    try {
      rxStore.setSubState(SubState.loading);
      var response = await _repository.createUser(
        name: rxStore.name,
        email: rxStore.email,
        password: rxStore.password,
      );
      print("RESPOSTA NO CONTROLLER: ${response.data}");
      if (response != null) {
        rxStore.setSubState(SubState.success);
        await Future.delayed(Duration(milliseconds: 2000));
        Modular.to.pushReplacementNamed("/login");
      }
    } catch (e) {
      print(e);
      rxStore.setSubState(SubState.error);
      await Future.delayed(Duration(milliseconds: 1500));
      rxStore.setSubState(SubState.start);
    }
  }
}
