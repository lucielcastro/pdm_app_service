// import 'package:app_servicos/app/constants/text/text_title.dart';
// import 'package:app_servicos/app/constants/widgets/app_bar/app_bar_widget.dart';
// import 'package:app_servicos/app/constants/widgets/buttons/button.dart';
// import 'package:app_servicos/app/pages/payments_page/payments.dart';
// import 'package:app_servicos/app/pages/search_service_page/mais_inforcoes_page/detalhes_agendamento/components/dividerWidget.dart';
// import 'package:app_servicos/app/pages/search_service_page/mais_inforcoes_page/mais_informacoes_page.dart';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../horario_controller.dart';
// import '../servico_controller.dart';

// class DetalhesAgendamento extends StatelessWidget {
//   var estabelecimento;
//   final HorarioController horarioController;
//   final ServicoController servicoController;

//   DetalhesAgendamento({
//     super.key,
//     required this.horarioController,
//     required this.servicoController,
//     required this.estabelecimento,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Container(
//           width: Get.width,
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//           child: Column(
//             //mainAxisAlignment: MainAxisAlignment.end,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Obx(
//                 () => Expanded(
//                   child: Column(
//                     //mainAxisAlignment: MainAxisAlignment.start,

//                     children: [
//                       AppBarWidget(
//                         icon: 'angle_left',
//                         onTap: () {
//                           Get.back();
//                         },
//                       ),
//                       TextTitle(
//                         textTitle: 'Detalhes de Agendamentos',
//                       ),
//                       SizedBox(
//                         height: 30,
//                       ),
//                       DividerWidget(),
//                       Text(
//                         'Local: ${estabelecimento}',
//                         style: TextStyle(
//                           fontSize: 18,
//                           color: Colors.black,
//                         ),
//                       ),
//                       Text(
//                         horarioController.horarioSelecionado.value.isNotEmpty
//                             ? 'Horário: ${horarioController.horarioSelecionado.value}'
//                             : 'Nenhum horário selecionado',
//                         style: TextStyle(fontSize: 18, color: Colors.black),
//                       ),
//                       Text(
//                         servicoController.servicoSelecionado.value.isNotEmpty
//                             ? 'Serviço: ${servicoController.servicoSelecionado.value}'
//                             : 'Nenhum horário selecionado',
//                         style: TextStyle(
//                           fontSize: 18,
//                           color: Colors.black,
//                         ),
//                       ),
//                       DividerWidget(),
//                     ],
//                   ),
//                 ),
//               ),
//               //rever depois
//               // SizedBox(
//               //   height: 200,
//               // ),
//               //tornar dinâmico depois
//               Column(
//                 children: [
//                   Align(
//                     alignment: Alignment.bottomLeft,
//                     child: Text(
//                       'Total .......................................... R\$ 40,00',
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),

//                   ///rever depois
//                   SizedBox(
//                     height: 70,
//                   ),
//                   Button(
//                     textButton: 'Ir para pagamento',
//                     onTap: () => Get.to(() => Payments()),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
