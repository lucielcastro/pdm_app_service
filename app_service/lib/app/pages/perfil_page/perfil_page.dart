import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../auth_controller.dart';
import '../../constants/const_colors.dart';
import '../../constants/svg_asset.dart';
import '../register_service_page/register_service_controller.dart';
import 'components/icons_custom_perfil.dart';
import 'editar_perfil/editar_perfil_page.dart';

class PerfilPage extends StatelessWidget {
  late RegisterServiceController controller;
  AuthController authController = AuthController();

  PerfilPage({
    super.key,
  }) {
    controller =
        Get.put<RegisterServiceController>(RegisterServiceController());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: ConstColors.white,
        width: Get.width,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 60,
            ),
            // Container(
            //   height: 100,
            //   child: ClipOval(
            //     child: Image.network(
            //       // placeholder: "assets/icons/user.svg",
            //       authController.user?.photoURL ?? 'https://www.flaticon.com/free-icon-font/user_3917705',
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // ),
            // ),
            const SizedBox(
              height: 10,
            ),
            Text(
              authController.user?.displayName ?? "User",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: ConstColors.black,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Divider(
              height: 5,
              color: ConstColors.black,
            ),
            IconsCustomPerfil(
              icon: 'user',
              title: 'Informações Pessoais',
              onTap: () {},
            ),
            IconsCustomPerfil(
              icon: 'sino',
              title: 'Notificações',
              onTap: () {},
            ),
            IconsCustomPerfil(
              icon: 'definicoes',
              title: 'Configurações',
              onTap: () {},
            ),
            IconsCustomPerfil(
              icon: 'sign_out',
              title: 'Sair',
              onTap: () {
                authController.logOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
