import 'package:app_servicos/app/pages/register_service_page/banking_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/const_colors.dart';
import '../../constants/text/text_title.dart';
import '../../constants/widgets/app_bar/app_bar_widget.dart';
import '../../constants/widgets/buttons/button.dart';
import 'register_service_controller.dart';
import 'components/alerta_opcoes.dart';
import 'components/rounded_input.dart';
import 'components/txt_fileld.dart';
import 'option_service.dart';

class RegisterService extends StatefulWidget {
  const RegisterService({super.key});

  @override
  State<RegisterService> createState() => _RegisterServiceState();
}

class _RegisterServiceState extends State<RegisterService> {
  // var textController = TextEditingController();

  String professionText = 'Nenhuma Profissão';
  String optionText = 'Nenhuma Opção';

  RegisterServiceController controller =
      Get.put<RegisterServiceController>(RegisterServiceController());

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController cidadeController = TextEditingController();
  final TextEditingController bairroController = TextEditingController();
  final TextEditingController ruaController = TextEditingController();
  final TextEditingController numeroController = TextEditingController();

  // @override
  // void initState() {
  //   nomeController.text = controller.userData['name'];
  //   cpfController.text = controller.userData['cpf'];
  //   cidadeController.text = controller.userData['cidade'];
  //   bairroController.text = controller.userData['bairro'];
  //   ruaController.text = controller.userData['rua'];
  //   numeroController.text = controller.userData['numero'];

  //   super.initState();
  // }

  // void updateMapValue(String key, String value) {
  //   setState(() {
  //     controller.userData[key] = value;
  //   });
  // }

  void _handleSelectionChanged(String profession, String option) {
    setState(() {
      professionText = profession;
      optionText = option;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          color: ConstColors.white,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarWidget(
                icon: 'angle_left',
                onTap: () {
                  Get.back();
                },
              ),
              TextTitle(
                textTitle: 'Informações Pessoais',
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
              TextTitle(
                textTitle: 'Endereço',
              ),
              RoundedInputField(
                controller: cidadeController,
                hintText: 'Cidade',
                onChanged: (value) {},
              ),
              RoundedInputField(
                controller: bairroController,
                hintText: 'Bairro',
                onChanged: (value) {},
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 5,
                    child: RoundedInputField(
                      controller: ruaController,
                      hintText: 'Rua',
                      onChanged: (value) {},
                      width: Get.width - 250,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: RoundedInputField(
                      controller: numeroController,
                      hintText: 'N°',
                      onChanged: (value) {},
                      width: Get.width - 200,
                    ),
                  ),
                ],
              ),
              // AlertaServicos(
              //   professionMap: controller.professionMap,
              //   professionOptions: controller.professionOptions,
              //   onSelectionChanged: (profession, option) {
              //     setState(() {
              //       professionText = profession;
              //       optionText = option!;
              //     });
              //   },
              // ),
              // Text('Seleção: $professionText - $optionText'),

              // Spacer(),

              // Button(
              //   colorButton: ConstColors.blue,
              //   textButton: 'Avançar',
              //   onTap: () {
              //     Get.to(() => DadosBancarios());
              //   },
              // ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Button(
          colorButton: ConstColors.blue,
          textButton: 'Avançar',
          onTap: () {
            Get.to(() => BankingData());
          },
        ),
      ),
    );
  }
}
