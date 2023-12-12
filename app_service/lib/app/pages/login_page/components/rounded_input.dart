import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/const_colors.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final bool obscure;

  RoundedInputField(
      {super.key,
      required this.hintText,
      required this.icon,
      required this.onChanged,
      required this.controller,
      this.obscure = false,
      });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: Get.width - 40,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: ConstColors.backgroundGrey,
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        controller: controller,
        onChanged: (value) {},
        decoration: InputDecoration(
            icon: Icon(
              icon,
              color: Colors.grey,
            ),
            hintText: hintText,
            border: InputBorder.none),
      ),
    );
  }
}
