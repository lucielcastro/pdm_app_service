import 'package:app_servicos/app/pages/home_page/home_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../auth_controller.dart';
import '../../constants/const_colors.dart';
import '../../constants/image_asset.dart';
import '../../constants/text/text_description.dart';
import '../../constants/widgets/buttons/button.dart';
import '../initial_page/initial_page.dart';
import '../search_service_page/search_service_page.dart';
import '../signUp_page/signUp_page.dart';
import 'components/divider_widget.dart';
import 'components/rounded_input.dart';
import 'components/social_icon.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  AuthController authController = AuthController();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        width: w,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ImageAsset(
                image: "logo-main",
                imageH: 200,
              ),
              RoundedInputField(
                controller: emailController,
                hintText: 'Email',
                icon: Icons.email_outlined,
                onChanged: (value) {},
              ),
              RoundedInputField(
                controller: passwordController,
                hintText: 'Senha',
                icon: Icons.lock_clock_outlined,
                onChanged: (value) {},
              ),
              const SizedBox(
                height: 2,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Esqueceu sua senha?',
                    style: TextStyle(fontSize: 18, color: ConstColors.cutGrey),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              // Expanded(
              //   child:
              Button(
                // width: Get.width - 40,
                // colorButton: ConstColors.yellow,
                textColor: ConstColors.white,
                textButton: 'Entrar',
                onTap: () {
                  // Get.to(() => HomePage(email: emailController.text.trim()));
                  //Get.to(() => HomePage(email: '',));

                  // AuthController.instance.login(emailController.text.trim(),
                  //     passwordController.text.trim());
                  authController.login(emailController.text.trim(),
                      passwordController.text.trim());
                },
              ),
              // ),
              const SizedBox(
                height: 2,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Divider(
              //       height: 5,
              //       color: ConstColors.cutGrey,
              //     ),
              //     TextDescription(
              //       textDescription: 'ou',
              //       paddingText: true,
              //     ),
              //     Divider(
              //       height: 5,
              //       color: ConstColors.cutGrey,
              //     ),
              //   ],
              // ),

              const SizedBox(
                height: 5,
              ),
              const DividerWidget(),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     SocialIcon(
              //       icon: 'twitter',
              //       onTap: () {},
              //     ),
              SocialIcon(
                icon: 'google-plus',
                onTap: () {
                  authController.signInWithGoogle();
                },
                textButton: 'Continue com o Google',
              ),
              SocialIcon(
                icon: '',
                onTap: () {
                  authController.signInWithFacebook();
                },
                textButton: 'Continue com o Facebook',
              ),
              //   ],
              // ),
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Não tem uma conta? ',
                  style: TextStyle(fontSize: 18, color: Colors.grey[500]),
                  children: [
                    TextSpan(
                        text: 'Criar',
                        style: const TextStyle(
                            color: ConstColors.orange,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.to(() => const SignUpPage()))
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
