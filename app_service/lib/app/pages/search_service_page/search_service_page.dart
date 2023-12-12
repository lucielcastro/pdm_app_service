import 'package:app_servicos/app/pages/more_info_page/more_info_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/const_colors.dart';
import '../../constants/widgets/app_bar/app_bar_widget.dart';
import 'components/search_widget.dart';
import 'components/txt_widget.dart';
import 'search_service_controller.dart';

class SearchServicePage extends StatelessWidget {
  late SearchServiceController controller;
  SearchServicePage({super.key}) {
    controller = Get.put<SearchServiceController>(SearchServiceController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.white,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Stack(
            children: [
              Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Builder(builder: (context) {
                          if (controller.orders.isEmpty) {
                            return const Center(
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      height: 18,
                                    ),
                                    Text(
                                      'Nenhum servico encontrado',
                                      style: TextStyle(
                                          color: ConstColors.cutGrey,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          } else {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 160,
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    '${controller.orders.length} resultados encontrados',
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                ...controller.orders.map(
                                  (e) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: SearchWidget(
                                      data: e,
                                      child: InkWell(
                                          onTap: () => Get.to(() =>
                                              MaisInformacoesPage(data: e)),
                                          child: TxtWidget(data: e)),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }
                        }),
                      ],
                    ),
                  ),
                ],
              ),
              // Inicio da parte de cima da tela
              Column(
                children: [
                  AppBarWidget(
                    icon: 'angle_left',
                    onTap: () {
                      Get.back();
                    },
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: ConstColors.backgroundGrey,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Buscar",
                        hintStyle: TextStyle(
                          color: ConstColors.cutGrey,
                          fontSize: 16,
                        ),
                        suffixIcon: Icon(
                          Icons.search_rounded,
                          size: 30,
                          color: ConstColors.cutGrey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
