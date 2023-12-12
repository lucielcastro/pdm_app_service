import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/const_colors.dart';
import '../../constants/text/text_description.dart';
import '../../constants/text/text_money.dart';
import '../../constants/text/text_title.dart';
import '../../constants/widgets/buttons/button.dart';
import '../../data/data_base.dart';
import 'components/header_payments.dart';
import 'components/rounded_input.dart';
import 'payments_details.dart';

class Payments extends StatefulWidget {
  // late DataBase controller;
  Payments({super.key}) {
    // controller = Get.put(DataBase());
  }

  @override
  State<Payments> createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController cpfController = TextEditingController();
  DataBase controller = DataBase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: ConstColors.white,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const HeaderPayments(
                text: 'Pagamento',
              ),
              TextTitle(
                textTitle: 'Dados para o pagamento',
                paddingText: true,
              ),
              RoundedInputField(
                controller: nomeController,
                hintText: 'Nome',
                onChanged: (value) {},
              ),
              RoundedInputField(
                controller: cpfController,
                hintText: 'CPF',
                onChanged: (value) {},
              ),
              // const SizedBox(height: 20),
              TextTitle(
                textTitle: 'Forma de pagamento',
                paddingText: true,
              ),
              SizedBox(height: 10),
              Button(
                colorButton: ConstColors.neonGreen,
                textButton: 'PIX',
                onTap: () {},
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextDescription(
                textDescription: "Total: R\$ ${controller.servico['valor']}"),
            Button(
              textButton: 'Confirmar',
              colorButton: ConstColors.blue,
              onTap: () {
                Get.to(() => PaymentsDetails());
              },
            )
          ],
        ),
      ),
    );
  }
}
