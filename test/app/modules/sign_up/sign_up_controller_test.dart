import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:poke_api/app/modules/sign_up/sign_up_controller.dart';
import 'package:poke_api/app/modules/sign_up/sign_up_module.dart';

void main() {
  initModule(SignUpModule());
  SignUpController signup;

  setUp(() {
    signup = SignUpModule.to.get<SignUpController>();
  });

  group('SignUpController Test', () {
    test("First Test", () {
      expect(signup, isInstanceOf<SignUpController>());
    });

    
  });
}
