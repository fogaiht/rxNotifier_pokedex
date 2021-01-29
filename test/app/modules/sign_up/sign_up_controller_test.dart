import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:poke_api/app/modules/sign_up/sign_up_module.dart';
import 'package:poke_api/app/modules/sign_up/sign_up_rx_controller.dart';

void main() {
  initModule(SignUpModule());
  SignUpRxController signup;

  setUp(() {
    signup = SignUpModule.to.get<SignUpRxController>();
  });

  group('SignUpRxController Test', () {
    test("First Test", () {
      expect(signup, isInstanceOf<SignUpRxController>());
    });
  });
}
