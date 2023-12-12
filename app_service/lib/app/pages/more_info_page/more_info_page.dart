import 'package:app_servicos/app/constants/const_colors.dart';
import 'package:app_servicos/app/constants/widgets/app_bar/app_bar_widget.dart';
import 'package:app_servicos/app/constants/widgets/buttons/button.dart';
import 'package:app_servicos/app/pages/payments_page/scheduling_details.dart';
import 'package:app_servicos/app/pages/search_service_page/mais_inforcoes_page/detalhes_agendamento/detalhes_agendamento_page.dart';
import 'package:app_servicos/app/pages/search_service_page/search_service_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'horario_controller.dart';
import 'servico_controller.dart';

class MaisInformacoesPage extends StatelessWidget {
  Map data;
  late SearchServiceController controller;
  MaisInformacoesPage({super.key, required this.data}) {
    controller = Get.put<SearchServiceController>(SearchServiceController());
  }

  final HorarioController horarioController = Get.put(HorarioController());
  final ServicoController servicoController = Get.put(ServicoController());

  @override
  Widget build(BuildContext context) {
    var estabelecimento = data["user"];
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            width: Get.width,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBarWidget(
                  icon: 'angle_left',
                  onTap: () {
                    Get.back();
                  },
                ),
                const SizedBox(height: 5),
                // const Align(
                //   alignment: Alignment.topLeft,
                //   child:
                const Text(
                  'Mais informações',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                // ),
                const SizedBox(height: 15),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ...data["location"].map((e) {
                        return Image.asset(
                          '$e',
                          fit: BoxFit.cover,
                        );
                      }),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data["user"],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: ConstColors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data["address"][0],
                              style: TextStyle(
                                  fontSize: 16,
                                  //fontWeight: FontWeight.bold,
                                  color: Colors.grey[800]),
                            ),
                            Text(
                              data["address"][1],
                              style: TextStyle(
                                  fontSize: 16,
                                  //fontWeight: FontWeight.bold,
                                  color: Colors.grey[800]),
                            ),
                          ],
                        ),
                        Text(
                          data["distance"],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: ConstColors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Escolher Horário',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        InkWell(
                            onTap: () => _exibirHorario(context),
                            child: const Icon(
                              Icons.keyboard_arrow_down,
                              color: ConstColors.orange,
                              size: 30,
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Obx(() => Row(
                          children: [
                            //Text('Horario seleciondado: '),
                            Text(
                              horarioController
                                      .horarioSelecionado.value.isNotEmpty
                                  ? horarioController.horarioSelecionado.value
                                  : 'Nenhum',
                              style: TextStyle(
                                fontSize: 15,
                                color: horarioController
                                        .horarioSelecionado.value.isNotEmpty
                                    ? ConstColors.green
                                    : ConstColors.normalRed,
                              ),
                            ),
                          ],
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Escolher Serviço',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        InkWell(
                            onTap: () => _exibirServico(context),
                            child: const Icon(
                              Icons.keyboard_arrow_down,
                              color: ConstColors.orange,
                              size: 30,
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Obx(() => Row(
                          children: [
                            //Text('Serviço seleciondado: '),
                            Text(
                              servicoController
                                      .servicoSelecionado.value.isNotEmpty
                                  ? servicoController.servicoSelecionado.value
                                  : 'Nenhum',
                              style: TextStyle(
                                fontSize: 15,
                                color: servicoController
                                        .servicoSelecionado.value.isNotEmpty
                                    ? ConstColors.green
                                    : ConstColors.normalRed,
                              ),
                            ),
                          ],
                        )),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: Button(
            textButton: 'Agendar',
            onTap: () {
              if (horarioController.horarioSelecionado.isNotEmpty &&
            servicoController.servicoSelecionado.isNotEmpty) {
               Get.to(() => SchedulingDetails(
                estabelecimento: estabelecimento,
                horarioController: horarioController,
                servicoController: servicoController));}else{
                       Get.snackbar(
            'Aviso',
            'Por favor, selecione um horário e um serviço.',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
                }
                
                }
          ),
        ));
  }

  Future<void> _exibirHorario(BuildContext context) async {
    final selecionado = await showModalBottomSheet<String>(
      context: context,
      isDismissible: false,
      // isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          height: Get.height / 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // primeira linha de botões
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ...data["horario"]
                      .sublist(0, data["horario"].length ~/ 2)
                      .map((e) {
                    return ElevatedButton(
                      onPressed: () {
                        Get.back(result: e); // Fecha o dialog
                        // Adicione a lógica para este horário
                      },
                      child: Text('$e'),
                    );
                  }),
                ],
              ),
              const SizedBox(height: 16),
              // segunda linha de botões
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ...data["horario"]
                      .sublist(data["horario"].length ~/ 2)
                      .map((e) {
                    return ElevatedButton(
                      onPressed: () {
                        Get.back(result: e); // Fecha o dialog
                        // Adicione a lógica para este horário
                      },
                      child: Text('$e'),
                    );
                  }),
                ],
              ),
            ],
          ),
        );
      },
    );

    if (selecionado != null) {
      horarioController.selecionarHorario(selecionado);
    }
  }

  Future<void> _exibirServico(BuildContext context) async {
    final selecionado = await showModalBottomSheet<String>(
      context: context,
      isDismissible: false,
      // isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          height: Get.height / 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // primeira linha de botões
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ...data["servico"]
                      .sublist(0, data["servico"].length ~/ 2)
                      .map((e) {
                    return ElevatedButton(
                      onPressed: () {
                        Get.back(result: e); // Fecha o dialog
                        // Adicione a lógica para este horário
                      },
                      child: Text('$e'),
                    );
                  }),
                ],
              ),
              const SizedBox(height: 16),
              // segunda linha de botões
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ...data["servico"]
                      .sublist(data["servico"].length ~/ 2)
                      .map((e) {
                    return ElevatedButton(
                      onPressed: () {
                        Get.back(result: e); // Fecha o dialog
                        // Adicione a lógica para este horário
                      },
                      child: Text('$e'),
                    );
                  }),
                ],
              ),
            ],
          ),
        );
      },
    );
    if (selecionado != null) {
      servicoController.selecionarServico(selecionado);
    }
  }
}
