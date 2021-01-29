import 'package:poke_api/app/modules/sign_up/sign_up_rx_store.dart';
import 'package:validators/validators.dart';

class SignUpRxValidator {
  final SignUpRxStore rxStore;

  final List<String> passRegexSteps = [
    r"^(?=.*?[A-Z]).{1,}",
    r"^(?=.*?[a-z]).{1,}",
    r"^(?=.*?[0-9])",
    r"^(?=.*?[!@#\$&*~])"
  ];
  final String passwordRegExpression = r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$";

  SignUpRxValidator(this.rxStore);

  String validateName() => (rxStore.name == null || rxStore.name.isEmpty) ? 'Insira um nome válido.' : null;

  String validateEmail() => !isEmail(rxStore.email) || rxStore.email.isEmpty ? 'Insira um email válido.' : null;

  String validatePassword() {
    final value = rxStore.password;
    if (value.isEmpty) {
      return 'Insira sua senha.';
    } else if (value.length < 6) {
      return 'A senha deve conter no mínimo 6 caracteres.';
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

  String validateConfirmPassword() {
    if (rxStore.confirmPassword != rxStore.password) {
      return "As senhas não são iguais.";
    } else {
      return null;
    }
  }
}
