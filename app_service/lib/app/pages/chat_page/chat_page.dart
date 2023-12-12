import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/const_colors.dart';
import 'components/chat_widget.dart';
import 'components/header_chat_widget.dart';

class ChatPage extends StatelessWidget {
  Map data;
  ChatPage({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            color: ConstColors.white,
            width: Get.width,
            child: SingleChildScrollView(
              child: Column(
                children: [ChatWidGet()],
              ),
            ),
          ),
          HeaderWidget(data: data),
        ],
      ),
    );
  }
}
