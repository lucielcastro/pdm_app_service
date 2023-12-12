import 'package:app_servicos/app/pages/chat_page/chat_page.dart';
import 'package:app_servicos/app/pages/conversations_page/conversations_page.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/const_colors.dart';
import '../register_service_page/register_service.dart';
import '../initial_page/initial_page.dart';
import '../meus_servicos_page/mais_informacoes/mais_informacoes.dart';
import '../meus_servicos_page/meus_servicos.dart';
import '../payments_page/payment_proof.dart';
import '../payments_page/payments.dart';
import '../payments_page/payments_details.dart';
import '../payments_page/scheduling_details.dart';
import '../perfil_page/perfil_page.dart';
import '../search_service_page/search_service_page.dart';
import 'bottom_menu.dart';
import 'home_controller.dart';

class HomePage extends StatelessWidget {
  late HomeController controller;
  var pageKey = GlobalKey();
  HomePage({
    Key? key,
    required String email,
  }) : super(key: key) {
    controller = Get.put(HomeController());
  }

  @override
  Widget build(BuildContext context) {
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      backgroundColor: ConstColors.white,
      body: GetBuilder<HomeController>(builder: (controller) {
        return Row(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: PageView(
                          key: pageKey,
                          controller: controller.pc,
                          onPageChanged: (pageIndex) {
                            EasyDebounce.debounce("onPageChanged",
                                const Duration(milliseconds: 150), () {
                              controller.setCurrentPage(pageIndex);
                            });
                          },
                          children: [
                            InitialPage(),
                            // SchedulingDetails(),
                            // SearchPage(),
                            //ChatPage(data: {}),
                            ConversationsPage(),
                            PerfilPage(),
                            // PaymentProof(),
                            // PaymentsDetails(),
                            // Payments(),
                            // SearchPage(),
                            // MeusServicos(),
                            // RoutesPage(),
                            // OrdersPage(),

                            // PerfilPage(),
                          ],
                        ),
                      ),
                      Obx(() {
                        int currentIndex = controller.currentPage.value;
                        return isKeyboardOpen
                            ? const SizedBox()
                            : BottomMenu(
                                currentIndex: currentIndex,
                              );
                      })
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
