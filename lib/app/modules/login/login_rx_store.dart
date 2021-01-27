import 'dart:convert';

import 'package:poke_api/app/utils/sub_states.dart';
import 'package:rx_notifier/rx_notifier.dart';

class LoginRxStore {
  final _email = RxNotifier<String>("");
  String get email => _email.value;
  RxNotifier<String> get rxEmail => _email;
  setEmail(String value) => _email.value = value;

  final _password = RxNotifier<String>("");
  String get password => _password.value;
  RxNotifier<String> get rxPassword => _password;
  setPassword(String value) => _password.value = value;
  String get password64 => base64.encode(utf8.encode(password));

  final _showPassword = RxNotifier<bool>(false);
  bool get showPassword => _showPassword.value;
  changeVisibility() => _showPassword.value = !_showPassword.value;

  final _rememberMe = RxNotifier<bool>(true);
  bool get rememberMe => _rememberMe.value;
  changeRemember(bool value) => _rememberMe.value = value;

  final _subState = RxNotifier<SubState>(SubState.start);
  SubState get subState => _subState.value;
  setSubState(SubState value) => _subState.value = value;

  final _selectedBaseUrl = RxNotifier<String>("");
  String get selectedBaseUrl => _selectedBaseUrl.value;
  setBaseUrl(String value) => _selectedBaseUrl.value = value;
}
