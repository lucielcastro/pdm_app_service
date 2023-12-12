import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../auth_controller.dart';
import '../../constants/const_colors.dart';
import '../../constants/image_asset.dart';
import '../../constants/widgets/buttons/button.dart';
import '../register_service_page/components/rounded_input.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    var primeiroNomeController = TextEditingController();
    var sobrenomeController = TextEditingController();
    var emailController = TextEditingController();
    var senhaController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.topCenter,
        width: w,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(top: 20, bottom: 15),
                child: const ImageAsset(
                  image: "logo-main",
                  imageH: 150,
                ),
              ),
              const Text(
                'Criar Login',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
              const SizedBox(
                height: 30,
              ),
              RoundedInputField(
                controller: primeiroNomeController,
                hintText: 'Primerio nome',
                onChanged: (value) {},
              ),
              RoundedInputField(
                controller: sobrenomeController,
                hintText: 'Sobrenome',
                onChanged: (value) {},
              ),
              RoundedInputField(
                controller: emailController,
                hintText: 'Email',
                onChanged: (value) {},
              ),
              RoundedInputField(
                controller: senhaController,
                hintText: 'Senha',
                onChanged: (value) {},
              ),
              const SizedBox(
                height: 25,
              ),
              Button(
                colorButton: ConstColors.orange,
                textColor: ConstColors.white,
                textButton: 'Registra-se',
                onTap: () {
                  if (EmailValidator.validate(emailController.text.trim())) {
                    AuthController.instance.register(
                        emailController.text.trim(),
                        senhaController.text.trim(),
                        primeiroNomeController.text.trim(),
                        sobrenomeController.text.trim());
                  } else {
                    Get.snackbar(
                      'Aviso',
                      'Por favor, cadastre um email válido!.',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  }
                },
              ),
              const SizedBox(
                height: 2,
              ),
              RichText(
                text: TextSpan(
                  text: 'Tem uma conta? ',
                  style: TextStyle(fontSize: 18, color: Colors.grey[500]),
                  children: [
                    TextSpan(
                        text: 'Entrar',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.back())
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
