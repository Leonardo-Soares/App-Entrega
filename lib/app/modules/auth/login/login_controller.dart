import 'dart:developer';

import 'package:dartweek/app/core/constantes/constantes.dart';
import 'package:dartweek/app/core/exceptions/user_notfound_exception.dart';
import 'package:dartweek/app/core/mixins/loader_mixin.dart';
import 'package:dartweek/app/core/mixins/messages_mixin.dart';
import 'package:dartweek/app/repositories/auth/auth_repository.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController with LoaderMixin, MessagesMixin {
  final AuthRepsitory _authRepsitory;

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  LoginController({
    required AuthRepsitory authRepsitory,
  }) : _authRepsitory = authRepsitory;

  @override
  void onInit() {
    super.onInit();
    loaderListener(_loading);
    messageListener(_message);
  }

  Future<void> login({required String email, required String password}) async {
    try {
      _loading.toggle();
      final userLogged = await _authRepsitory.login(email, password);

      final storage = GetStorage();
      storage.write(Constats.USER_KEY, userLogged.id);
      _loading.toggle();
    } on UserNotFoundException catch (e, s) {
      _loading.toggle();
      log('Login ou senha inválidos', error: e, stackTrace: s);
      _message(
        MessageModel(
            title: 'Erro',
            message: 'Login ou senha inválidos',
            type: MessageType.error),
      );
    } catch (e, s) {
      _loading.toggle();
      log('Erro ao realizar login', error: e, stackTrace: s);
      _message(
        MessageModel(
            title: 'Erro',
            message: 'Erro ao realizar login',
            type: MessageType.error),
      );
    }
  }
}
