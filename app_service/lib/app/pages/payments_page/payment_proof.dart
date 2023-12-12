import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/const_colors.dart';
import '../../constants/svg_asset.dart';
import '../../constants/text/text_description.dart';
import '../../constants/text/text_money.dart';
import '../../constants/text/text_title.dart';
import '../../constants/widgets/buttons/button.dart';
import '../../data/data_base.dart';
import '../home_page/home_page.dart';
import '../initial_page/initial_page.dart';
import 'components/header_payments.dart';

class PaymentProof extends StatelessWidget {
  late DataBase controller;
  PaymentProof({super.key}) {
    controller = Get.put(DataBase());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ConstColors.white,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        // margin: EdgeInsets.symmetric(vertical: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderPayments(
              text: 'Comprovante de Pagamento',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextTitle(
                  textTitle: 'Dados da solicitação',
                  paddingText: true,
                ),
                TextDescription(
                  textDescription: 'Status: ${controller.servico['status']}',
                ),
              ],
            ),
            const Divider(
              height: 5,
              color: ConstColors.cutGrey,
            ),
            TextDescription(
              textDescription: 'N° ${controller.servico['n_servico']}',
              paddingText: true,
            ),
            TextDescription(
              textDescription:
                  '${controller.servico['data']} | ${controller.servico['hora']}',
              paddingText: true,
            ),
            const Divider(
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
            const Divider(
              height: 5,
              color: ConstColors.cutGrey,
            ),
            TextDescription(
              textDescription: '${controller.servico['nome']}',
              paddingText: true,
            ),
            TextDescription(
              textDescription:
                  '${controller.servico['servico']}  R\$${controller.servico['valor']}',
              paddingText: true,
            ),
            const Divider(
              height: 5,
              color: ConstColors.cutGrey,
            ),
            // const SizedBox(height: 80),

            const Expanded(
              flex: 100,
              child: Center(
                child: SvgAsset(
                  image: 'qrcode',
                  imageH: 150,
                ),
              ),
            ),
            const Spacer(),
            Button(
              textButton: 'Salvar',
              colorButton: ConstColors.blue,
              onTap: () {
                Get.to(HomePage(email: '',));
              },
            )
          ],
        ),
      ),
    );
  }
}
