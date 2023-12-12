import 'package:app_servicos/app/pages/chat_page/chat_page.dart';
import 'package:app_servicos/app/pages/chat_page/components/header_chat_widget.dart';
import 'package:app_servicos/app/pages/conversations_page/components/conversations_widget.dart';
import 'package:app_servicos/app/pages/conversations_page/conversations_controller.dart';
import 'package:app_servicos/app/pages/search_service_page/search_service_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/const_colors.dart';

class ConversationsPage extends StatelessWidget {
  late ConversationsController controller;
  ConversationsPage({super.key}) {
    controller = Get.put<ConversationsController>(ConversationsController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.white,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        padding: EdgeInsets.only(top: 30),
        child: Stack(
          children: [
            Container(
              // margin: EdgeInsets.only(top: 100),
              child: Stack(children: [
                Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 130,
                        ),
                        ...controller.orders.map(
                          (e) => Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: InkWell(
                              onTap: () => Get.to(() => ChatPage(data: e)),
                              child: ConversationshWidget(data: e),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ]),
            ),
            Container(
              child: Stack(
                children: [
               
        
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
