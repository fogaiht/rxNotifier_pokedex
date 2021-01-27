import 'package:rx_notifier/rx_notifier.dart';
import 'package:validators/validators.dart';

import 'login_rx_store.dart';

class LoginRxValidator {
  final LoginRxStore rxStore;

  LoginRxValidator(this.rxStore);

  final _attributes = RxNotifier<Map<String, dynamic>>({});
  Map<String, dynamic> get attributes => _attributes.value;
  setAttributes(Map<String, dynamic> value) => _attributes.value = value;

  final List<String> passRegexSteps = [
    r"^(?=.*?[A-Z]).{1,}",
    r"^(?=.*?[a-z]).{1,}",
    r"^(?=.*?[0-9])",
    r"^(?=.*?[!@#\$&*~])"
  ];
  final String passwordRegExpression = r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$";

  String validateEmail() => !isEmail(rxStore.email) || rxStore.email.isEmpty ? 'Insira um email válido.' : null;

  String validatePassword() {
    final value = rxStore.password;
    if (value.isEmpty) {
      return 'Insira sua senha.';
    } else if (value.length < 6) {
      return 'A senha deve conter\nno mínimo 6 caracteres.';
    } else if (!RegExp(passwordRegExpression).hasMatch(value)) {
      if (!RegExp(passRegexSteps[0]).hasMatch(value)) {
        return 'A senha deve conter uma letra maiúscula.';
      } else if (!RegExp(passRegexSteps[1]).hasMatch(value)) {
        return 'A senha deve conter uma letra minúscula.';
      } else if (!RegExp(passRegexSteps[2]).hasMatch(value)) {
        return 'A senha deve conter pelo menos um número.';
      } else if (!RegExp(passRegexSteps[3]).hasMatch(value)) {
        return 'A senha deve conter pelo menos um caracter especial';
      } else {
        return null;
      }
    } else {
      return null;
    }
  }
}
