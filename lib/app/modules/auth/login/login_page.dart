import 'dart:ffi';

import 'package:dartweek/app/core/ui/config_ui.dart';
import 'package:dartweek/app/core/ui/vakinha_state.dart';
import 'package:dartweek/app/core/ui/widgets/vakinha_appbar.dart';
import 'package:dartweek/app/core/ui/widgets/vakinha_button.dart';
import 'package:dartweek/app/core/ui/widgets/vakinha_textformfield.dart';
import 'package:dartweek/app/modules/auth/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends VakinhaState<LoginPage, LoginController> {
  final _fomrKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailEC.dispose();
    _passwordEC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VakinhaAppbar(
        elevation: 0,
      ),
      body: LayoutBuilder(builder: (_, constraints) {
        return ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _fomrKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Login',
                      style: context.textTheme.headline6?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: context.theme.primaryColorDark),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    VakinhaTextfromfield(
                      label: 'Email:',
                      controller: _emailEC,
                      validator: Validatorless.multiple([
                        Validatorless.required('Email não foi prenchido'),
                        Validatorless.email('O email está incorreto'),
                      ]),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    VakinhaTextfromfield(
                      label: 'Senha:',
                      obscureText: true,
                      controller: _passwordEC,
                      validator: Validatorless.multiple([
                        Validatorless.required('Senha não foi preenchida'),
                        Validatorless.min(6, 'Senha está incompleta'),
                      ]),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Center(
                      child: VakinhaButton(
                        width: double.infinity,
                        label: 'ENTRAR',
                        onPressed: () {
                          final formValid =
                              _fomrKey.currentState?.validate() ?? false;
                          if (formValid) {
                            controller.login(
                                email: _emailEC.text,
                                password: _passwordEC.text);
                          }
                        },
                      ),
                    ),
                    // Tudo depois do Spacer será empurrado para baixo
                    const Spacer(),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      const Text('Não possui uma conta?'),
                      TextButton(
                          onPressed: () {
                            Get.toNamed('auth/register');
                          },
                          child: const Text(
                            'Cadastre-se',
                            style: ConfigUI.textBold,
                          ))
                    ]),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
