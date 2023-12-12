import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/const_colors.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final width;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const RoundedInputField({
    super.key,
    this.width,
    required this.hintText,
    required this.onChanged,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Container(
      width: width ?? Get.width,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: ConstColors.backgroundGrey, width: 2),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        controller: controller,
        onChanged: (value) {},
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
