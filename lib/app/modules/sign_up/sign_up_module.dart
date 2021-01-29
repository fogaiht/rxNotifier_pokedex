import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/custom_dio/custom_dio.dart';
import 'sign_up_page.dart';
import 'sign_up_repository.dart';
import 'sign_up_rx_controller.dart';
import 'sign_up_rx_store.dart';
import 'sign_up_rx_validator.dart';

class SignUpModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SignUpRxController(
              i.get<SignUpRepository>(),
              i.get<SignUpRxStore>(),
              i.get<SignUpRxValidator>(),
            )),
        Bind((i) => SignUpRepository(Modular.get<CustomDio>())),
        Bind((i) => SignUpRxValidator(i.get<SignUpRxStore>())),
        Bind((i) => SignUpRxStore()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => SignUpPage()),
      ];

  static Inject get to => Inject<SignUpModule>.of();
}
