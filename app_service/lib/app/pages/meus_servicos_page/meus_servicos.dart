import 'package:app_servicos/app/pages/meus_servicos_page/mais_informacoes/mais_informacoes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../register_service_page/register_service_controller.dart';
import 'components/containers_servicos.dart';

class MeusServicos extends StatelessWidget {
  RegisterServiceController controller =
      Get.put<RegisterServiceController>(RegisterServiceController());

  MeusServicos({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 80),
      ...controller.dadosLoja.map(
        (e) => InkWell(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: ContainersServicos(
              dados: e,
              onTap: () {
                Get.to(() => MaisInformacoes(
                      dados: {},
                    ));
              },
            ),
          ),
        ),
      ),
    ]);
  }
}
