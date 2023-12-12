import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/const_colors.dart';
import '../../constants/text/text_title.dart';
import '../../constants/widgets/app_bar/app_bar_widget.dart';
import '../../constants/widgets/buttons/button.dart';
import '../home_page/home_page.dart';
import '../initial_page/initial_page.dart';
import 'register_service_controller.dart';
import 'components/alerta_opcoes.dart';
import 'components/rounded_input.dart';
import 'components/txt_fileld.dart';
import 'option_service.dart';

class BankingData extends StatefulWidget {
  const BankingData({super.key});

  @override
  State<BankingData> createState() => _BankingDataState();
}

class _BankingDataState extends State<BankingData> {
  String professionText = 'Nenhuma Profissão';
  String optionText = 'Nenhuma Opção';

  RegisterServiceController controller =
      Get.put<RegisterServiceController>(RegisterServiceController());

  final TextEditingController agenciaController = TextEditingController();
  final TextEditingController numContaController = TextEditingController();
  final TextEditingController digitoContaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          color: Colors.white,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AppBarWidget(
                icon: 'angle_left',
                onTap: () {
                  Get.back();
                },
              ),
              TextTitle(
                textTitle: 'Dados Bancarios',
              ),
              RoundedInputField(
                controller: agenciaController,
                hintText: 'Agência',
                onChanged: (value) {},
              ),
              RoundedInputField(
                controller: numContaController,
                hintText: 'Conta',
                onChanged: (value) {},
              ),
              RoundedInputField(
                controller: digitoContaController,
                hintText: 'Digito',
                onChanged: (value) {},
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Button(
          colorButton: ConstColors.blue,
          textButton: 'Finalizar',
          onTap: () {
            Get.to(() => HomePage(email: '',));
          },
        ),
      ),
    );
  }
}
