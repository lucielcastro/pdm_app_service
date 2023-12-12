import 'package:app_servicos/app/data/user_controller.dart';
import 'package:app_servicos/app/pages/search_service_page/search_service_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../auth_controller.dart';
import '../../constants/const_colors.dart';
import '../../constants/svg_asset.dart';
import '../../constants/text/text_title.dart';
import '../register_service_page/register_service.dart';
import 'components/buscar_cadastrar_servico.dart';

class InitialPage extends StatelessWidget {
  final UserController _userController = Get.put(UserController());
  AuthController authController = AuthController();

  InitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: ListView(
          children: [
            Obx(() {
              final userData = _userController.userData.value;
              if (_userController.userData.value != null) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgAsset(image: "vector"),
                        // Container(
                        //   height: 50,
                        //   child: ClipOval(
                        //     child: Image.network(
                        //       // placeholder: "assets/icons/user.svg",
                        //       authController.user?.photoURL ?? 'https://www.flaticon.com/free-icon-font/user_3917705',
                        //       fit: BoxFit.cover,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          userData != null && userData['name'] != null
                              ? 'Olá, ${userData['name']}!'
                              : 'Olá', // Mensagem padrão se userData ou userData['name'] for nulo
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.orange,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: Get.width - 40,
                      height: 180,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: ConstColors.orange,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: TextTitle(
                        textTitle: 'Sugestões de Serviços',
                        textColor: ConstColors.white,
                      ),
                    ),
                    BuscarCadastrarServico(
                      image: 'search',
                      text: 'Buscar Serviços',
                      onTap: () {
                        Get.to(() => SearchServicePage());
                        // Get.to(() => SearchPage2());
                      },
                    ),
                    BuscarCadastrarServico(
                      image: 'adicionar',
                      text: 'Cadastrar Serviços',
                      onTap: () {
                        Get.to(() => RegisterService());
                      },
                    ),
                  ],
                );
              } else {
                return CircularProgressIndicator();
              }
            }),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Exemplo para fazer logout
      //     FirebaseAuth.instance.signOut();
      //   },
      //   child: Icon(Icons.logout),
      // ),
    );
  }
}
