import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:poke_api/app/modules/login/login_module.dart';
import 'package:poke_api/app/modules/login/login_rx_controller.dart';

void main() {
  initModule(LoginModule());
  LoginRxController login;

  setUp(() {
    login = LoginModule.to.get<LoginRxController>();
  });

  group('LoginRxController Test', () {
    test("First Test", () {
      expect(login, isInstanceOf<LoginRxController>());
    });
  });
}
