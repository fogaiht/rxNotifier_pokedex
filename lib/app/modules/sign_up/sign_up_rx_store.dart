import 'dart:convert';

import 'package:rx_notifier/rx_notifier.dart';

import '../../utils/sub_states.dart';

class SignUpRxStore {
  final _name = RxNotifier<String>("");
  String get name => _name.value;
  setName(String value) => _name.value = value;

  final _email = RxNotifier<String>("");
  String get email => _email.value;
  RxNotifier<String> get rxEmail => _email;
  setEmail(String value) => _email.value = value;

  final _password = RxNotifier<String>("");
  String get password => _password.value;
  RxNotifier<String> get rxPassword => _password;
  setPassword(String value) => _password.value = value;
  String get password64 => base64.encode(utf8.encode(password));

  final _confirmPassword = RxNotifier<String>("");
  String get confirmPassword => _confirmPassword.value;
  RxNotifier<String> get rxConfirmPassword => _password;
  setConfirmPassword(String value) => _confirmPassword.value = value;

  final _subState = RxNotifier<SubState>(SubState.start);
  SubState get subState => _subState.value;
  setSubState(SubState value) => _subState.value = value;
}
