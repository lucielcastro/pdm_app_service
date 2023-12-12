import 'package:app_servicos/app/pages/more_info_page/horario_controller.dart';
import 'package:app_servicos/app/pages/more_info_page/servico_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../constants/const_colors.dart';
import '../../constants/text/text_description.dart';
import '../../constants/text/text_money.dart';
import '../../constants/text/text_title.dart';
import '../../constants/widgets/buttons/button.dart';
import '../../data/data_base.dart';
import '../register_service_page/register_service_controller.dart';
import 'components/header_payments.dart';
import 'payments.dart';

class SchedulingDetails extends StatelessWidget {
  late DataBase controller;
  var estabelecimento;
  final HorarioController horarioController;
  final ServicoController servicoController;
  DateTime dataHoraAtual = DateTime.now();
  SchedulingDetails(
      {super.key,
      required this.horarioController,
      required this.servicoController,
      required this.estabelecimento}) {
    controller = Get.put<DataBase>(DataBase());
  }

  @override
  Widget build(BuildContext context) {
    String dateNow = DateFormat('dd/MM/yyyy').format(dataHoraAtual);
    String horaNow = DateFormat('HH:mm').format(dataHoraAtual);
    return Scaffold(
      body: Container(
        color: ConstColors.white,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderPayments(
              text: 'Detalhes do Agendamento',
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextTitle(
                  textTitle: 'Dados do pedido',
                  paddingText: true,
                ),
                const Divider(
                  height: 5,
                  color: ConstColors.cutGrey,
                ),
                TextDescription(
                  textDescription: 'Data: $dateNow',
                ),
                TextDescription(
                  textDescription: 'Hora: $horaNow',
                ),
                const Divider(
                  height: 5,
                  color: ConstColors.cutGrey,
                ),
                TextDescription(
                  textDescription: 'Local: $estabelecimento',
                  paddingText: true,
                ),
                const Divider(
                  height: 5,
                  color: ConstColors.cutGrey,
                ),
                TextDescription(
                  textDescription:
                      'Horário: ${horarioController.horarioSelecionado.value}',
                  //paddingText: true,
                ),
                TextDescription(
                  textDescription:
                      'Serviço: ${servicoController.servicoSelecionado.value}',
                  //paddingText: true,
                ),
                const Divider(
                  height: 5,
                  color: ConstColors.cutGrey,
                ),
              ],
            ),
            const Spacer(),
            Button(
              textButton: 'Ir para o pagamento',
              colorButton: ConstColors.blue,
              onTap: () {
                Get.to(() => Payments());
              },
            )
          ],
        ),
      ),
    );
  }
}
