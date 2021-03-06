import 'package:flutter/material.dart';
import 'package:vakinha_burger_mobile/app/core/ui/vakinha_state.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/vakinha_appbar.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/vakinha_button.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/vakinha_textformfield.dart';
import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/modules/auth/register/register_controller.dart';
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: IntrinsicHeight(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cadastro',
                      style: context.textTheme.headline6?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.theme.primaryColorDark,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Preencha os campos abaixo para criar o seu cadastro.',
                      style: context.textTheme.bodyText1,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    VakinhaTextformfield(
                      label: 'Nome',
                      controller: _nameEC,
                      validator: Validatorless.required('Nome Obrigat??rio'),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    VakinhaTextformfield(
                        label: 'E-mail',
                        controller: _emailEC,
                        validator: Validatorless.multiple([
                          Validatorless.required('E-mail Obrigat??rio'),
                          Validatorless.email('E-mail invalido')
                        ])),
                    const SizedBox(
                      height: 30,
                    ),
                    VakinhaTextformfield(
                        label: 'Senha',
                        obscureText: true,
                        controller: _passwordEC,
                        validator: Validatorless.multiple([
                          Validatorless.required('Senha Obrigat??rio'),
                          Validatorless.min(
                              6, 'Senha deve conter pelo menos 6 caracteres')
                        ])),
                    const SizedBox(
                      height: 30,
                    ),
                    VakinhaTextformfield(
                      label: 'Confirmar senha',
                      obscureText: true,
                      validator: Validatorless.multiple([
                        Validatorless.required('Confirmar senha Obrigat??rio'),
                        Validatorless.compare(
                            _passwordEC, 'As senhas n??o conferem')
                      ]),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: VakinhaButton(
                        width: context.width,
                        label: 'CADASTRAR',
                        onPressed: () {
                          final formvalid =
                              _formKey.currentState?.validate() ?? false;
                          if (formvalid) {
                            contoller.register(
                              name: _nameEC.text,
                              email: _emailEC.text,
                              password: _passwordEC.text,
                            );
                          }
                        },
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
