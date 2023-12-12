import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/const_colors.dart';
import '../../constants/text/text_description.dart';
import '../../constants/text/text_money.dart';
import '../../constants/text/text_title.dart';
import '../../constants/widgets/buttons/button.dart';
import '../../data/data_base.dart';
import 'components/header_payments.dart';
import 'payment_proof.dart';

class PaymentsDetails extends StatelessWidget {
  late DataBase controller;
  PaymentsDetails({super.key}) {
    controller = Get.put(DataBase());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ConstColors.white,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        // margin: EdgeInsets.symmetric(vertical: 100),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderPayments(
              text: 'Detalhes do Pagamento',
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextTitle(
                  textTitle: 'Dados da solicitação',
                  paddingText: true,
                ),
                Divider(
                  height: 5,
                  color: ConstColors.cutGrey,
                ),
                TextDescription(
                  textDescription: 'N° ${controller.servico['n_servico']}',
                  paddingText: true,
                ),
                TextDescription(
                  textDescription:
                      '${controller.servico['data']}  | ${controller.servico['hora']}',
                  paddingText: true,
                ),
                Divider(
                  height: 5,
                  color: ConstColors.cutGrey,
                ),
                TextDescription(
                  textDescription: 'Nome: ${controller.userData['nome']}',
                  paddingText: true,
                ),
                TextDescription(
                  textDescription: 'CPF: ${controller.userData['cpf']}',
                  paddingText: true,
                ),
                TextDescription(
                  textDescription:
                      'Forma de Pagamento: ${controller.servico['pagamento']}',
                  paddingText: true,
                ),
                Divider(
                  height: 5,
                  color: ConstColors.cutGrey,
                ),
              ],
            ),
            const Spacer(),
            TextDescription(
                textDescription: "Total: R\$ ${controller.servico['valor']}"),
            SizedBox(height: 10),
            Button(
              textButton: 'Finalizar',
              colorButton: ConstColors.blue,
              onTap: () {
                Get.to(() => PaymentProof());
              },
            )
          ],
        ),
      ),
    );
  }
}
