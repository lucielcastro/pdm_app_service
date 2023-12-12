import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/const_colors.dart';
import '../../../constants/widgets/buttons/button.dart';
import '../../register_service_page/register_service_controller.dart';
import '../perfil_page.dart';

class EditarPerfil extends StatefulWidget {
  const EditarPerfil({super.key});

  @override
  State<EditarPerfil> createState() => _EditarPerfilState();
}

class _EditarPerfilState extends State<EditarPerfil> {
  RegisterServiceController controller =
      Get.put<RegisterServiceController>(RegisterServiceController());

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController endController = TextEditingController();
  final TextEditingController cidadeController = TextEditingController();
  final TextEditingController estadoController = TextEditingController();

  @override
  void initState() {
    nomeController.text = controller.userData['name'];
    endController.text = controller.userData['address'];
    cidadeController.text = controller.userData['cidade'];
    estadoController.text = controller.userData['estado'];

    super.initState();
  }

  void updateMapValue(String key, String value) {
    setState(() {
      controller.userData[key] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      color: ConstColors.white,
      //margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  child: Icon(Icons.arrow_back_ios_new),
                  onTap: () => Get.back(result: PerfilPage())),
              Text(
                'Editar',
                style: TextStyle(
                    color: ConstColors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 20),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 15),
                height: 100,
                width: 95,
                decoration: BoxDecoration(
                  color: ConstColors.white,
                  border:
                      Border.all(color: ConstColors.backgroundGrey, width: 1),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Alterar',
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      'Foto',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 3,
          ),
          Column(
            children: [
              TxtField(
                dadosController: nomeController,
                hintTxt: 'Ex.: Josué',
                nomeCampo: 'Nome',
                onChanged: (value) {
                  updateMapValue('name', value);
                },
              ),
              TxtField(
                dadosController: endController,
                hintTxt: 'Ex.: Rua 9 de julho, 12, centro',
                nomeCampo: 'Endereço',
                onChanged: (value) {
                  updateMapValue('address', value);
                },
              ),
              TxtField(
                dadosController: cidadeController,
                hintTxt: 'Ex.: São Luis',
                nomeCampo: 'Cidade',
                onChanged: (value) {
                  updateMapValue('cidade', value);
                },
              ),
              TxtField(
                dadosController: estadoController,
                hintTxt: 'Ex.: Bahia',
                nomeCampo: 'Estado',
                onChanged: (value) {
                  updateMapValue('estado', value);
                },
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Status',
                    style: TextStyle(
                        color: ConstColors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 12),
                  ),
                  SizedBox(
                    //implentar depois
                    height: 2,
                  ),
                  Text(
                    'Selecione para realizar entregas em endereços combinados',
                    style: TextStyle(color: ConstColors.cutGrey, fontSize: 12),
                  ),
                  SizedBox(
                    //implentar depois
                    height: 2,
                  ),
                  Row(
                    children: [
                      Button(
                        // width: size.width*.2,
                        textColor: ConstColors.cutGrey,
                        // decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(10),
                        //     border: Border.all(
                        //         color: ConstColors.backgroundGrey, width: 1.5)),
                        colorButton:
                            ConstColors.white, //encontrar cor correta depois
                        textButton: 'Sim',
                        onTap: () {},
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Button(
                        // width: size.width*.2,
                        textColor: ConstColors.white,
                        colorButton: ConstColors.blue,
                        textButton: 'Não',
                        onTap: () {},
                      ),
                    ],
                  ),
                  Text(
                    '* O cliente pegará o pedido em seu endereço',
                    style: TextStyle(color: ConstColors.cutGrey, fontSize: 12),
                  ),
                ],
              ),
              Button(
                textColor: ConstColors.white,
                colorButton: ConstColors.blue,
                // width: size.width * .9,
                textButton: 'Salvar',
                onTap: () {},
              ),
            ],
          ),
        ]),
      ),
    ));
  }
}

class TxtField extends StatelessWidget {
  TxtField({
    super.key,
    required this.dadosController,
    required this.hintTxt,
    required this.nomeCampo,
    this.onChanged,
  });
  final onChanged;
  final String hintTxt;
  final String nomeCampo;
  final TextEditingController dadosController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 2),
          child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                nomeCampo,
                style: TextStyle(fontSize: 12),
              )),
        ),
        Container(
          margin: EdgeInsets.only(top: 2, bottom: 2),
          padding: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: ConstColors.backgroundGrey,
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextFormField(
            key: Key(hintTxt),
            autofocus: true,
            keyboardType: TextInputType.text,
            cursorColor: ConstColors.black,
            style: TextStyle(
              color: ConstColors.black,
              fontSize: 14,
              height: 1,
            ),
            onChanged: onChanged,
            controller: dadosController,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: ConstColors.backgroundGrey,
                  width: 1,
                ),
              ),
              border: UnderlineInputBorder(),
              hintStyle: TextStyle(
                color: ConstColors.lightGrey,
                fontSize: 14,
                height: 1,
              ),
              hintText: hintTxt,
            ),
          ),
        ),
      ],
    );
  }
}
