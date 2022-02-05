import 'package:dartweek/app/core/ui/config_ui.dart';
import 'package:dartweek/app/core/ui/widgets/vakinha_appbar.dart';
import 'package:dartweek/app/core/ui/widgets/vakinha_button.dart';
import 'package:dartweek/app/core/ui/widgets/vakinha_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VakinhaAppbar(
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: IntrinsicHeight(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cadastro',
                    style: context.textTheme.headline4?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.theme.primaryColorDark),
                  ),
                  Text(
                    'Preencha os campos abaixo para criar o seu Cadastro.',
                    style: context.textTheme.headline6?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.theme.primaryColorDark),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  const VakinhaTextfromfield(label: 'Nome:'),
                  const SizedBox(
                    height: 16,
                  ),
                  const VakinhaTextfromfield(label: 'Email:'),
                  const SizedBox(
                    height: 16,
                  ),
                  const VakinhaTextfromfield(label: 'Senha:'),
                  const SizedBox(
                    height: 16,
                  ),
                  const VakinhaTextfromfield(label: 'Confirmar Senha:'),
                  const SizedBox(
                    height: 32,
                  ),
                  Center(
                    child: VakinhaButton(
                      width: double.infinity,
                      label: 'CADASTRAR',
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
