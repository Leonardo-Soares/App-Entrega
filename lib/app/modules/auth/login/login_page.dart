import 'package:dartweek/app/core/ui/config_ui.dart';
import 'package:dartweek/app/core/ui/widgets/vakinha_appbar.dart';
import 'package:dartweek/app/core/ui/widgets/vakinha_button.dart';
import 'package:dartweek/app/core/ui/widgets/vakinha_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
                    const VakinhaTextfromfield(label: 'Email:'),
                    const SizedBox(
                      height: 16,
                    ),
                    const VakinhaTextfromfield(label: 'Senha:'),
                    const SizedBox(
                      height: 32,
                    ),
                    Center(
                      child: VakinhaButton(
                        width: double.infinity,
                        label: 'ENTRAR',
                        onPressed: () {},
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
