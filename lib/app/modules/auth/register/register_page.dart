import 'package:dartweek/app/core/ui/vakinha_state.dart';
import 'package:dartweek/app/core/ui/widgets/vakinha_appbar.dart';
import 'package:dartweek/app/core/ui/widgets/vakinha_button.dart';
import 'package:dartweek/app/core/ui/widgets/vakinha_textformfield.dart';
import 'package:dartweek/app/modules/auth/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState
    extends VakinhaState<RegisterPage, RegisterController> {
  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _nameEC.dispose();
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

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
              key: _formKey,
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
                  VakinhaTextfromfield(
                    label: 'Nome:',
                    controller: _nameEC,
                    validator: Validatorless.required('Nome é obrigatório'),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  VakinhaTextfromfield(
                    label: 'Email:',
                    controller: _emailEC,
                    validator: Validatorless.multiple([
                      Validatorless.required('Email é obrigatório'),
                      Validatorless.email('Email incorreto'),
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
                      Validatorless.required('Senha é obrigatória'),
                      Validatorless.min(
                          6, 'Senha deve conter pelo menos 6 caracteres'),
                    ]),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  VakinhaTextfromfield(
                    label: 'Confirmar Senha:',
                    obscureText: true,
                    validator: Validatorless.multiple([
                      Validatorless.required('Confirmar senha é obrigatória'),
                      Validatorless.compare(_passwordEC, 'Senhas diferentes !'),
                    ]),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Center(
                    child: VakinhaButton(
                      width: double.infinity,
                      label: 'CADASTRAR',
                      onPressed: () {
                        final formValid =
                            _formKey.currentState?.validate() ?? false;
                        if (formValid) {
                          controller.register(
                              name: _nameEC.text,
                              email: _emailEC.text,
                              password: _passwordEC.text);
                        }
                      },
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
