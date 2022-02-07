import 'dart:developer';

import 'package:dartweek/app/core/constantes/constantes.dart';
import 'package:dartweek/app/core/mixins/loader_mixin.dart';
import 'package:dartweek/app/core/mixins/messages_mixin.dart';
import 'package:dartweek/app/core/rest_client/rest_client.dart';
import 'package:dartweek/app/repositories/auth/auth_repository.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RegisterController extends GetxController
    with LoaderMixin, MessagesMixin {
  final AuthRepository _authRepository; 

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  RegisterController({
    required AuthRepository authRepsitory,
  }) : _authRepository = authRepsitory;

  @override
  void onInit() {
    loaderListener(_loading);
    messageListener(_message);
    super.onInit();
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      _loading.toggle();
      final userLogged = await _authRepository.register(name, email, password);
      _loading.toggle();
      GetStorage().write(Constants.USER_KEY, userLogged.id);
    } on RestClientException catch (e, s) {
      _loading.toggle();
      log('Erro ao registrar login', error: e, stackTrace: s);
      _message(
        MessageModel(
          title: 'Erro',
          message: e.message,
          type: MessageType.info,
        ),
      );
    } catch (e, s) {
      _loading.toggle();
      log('Erro ao registrar login', error: e, stackTrace: s);
      _message(
        MessageModel(
          title: 'Erro',
          message: 'Erro ao registrar login',
          type: MessageType.error,
        ),
      );
    }
  }
}
