import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/custom_dio/custom_dio.dart';
import 'login_page.dart';
import 'login_repository.dart';
import 'login_rx_controller.dart';
import 'login_rx_store.dart';
import 'login_rx_validator.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LoginRxController(
              i.get<LoginRepository>(),
              i.get<LoginRxValidator>(),
              i.get<LoginRxStore>(),
            )),
        Bind((i) => LoginRepository(i.get<CustomDio>())),
        Bind((i) => LoginRxValidator(i.get<LoginRxStore>())),
        Bind((i) => LoginRxStore()),
        Bind((i) => CustomDio()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => LoginPage()),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
