import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../const_colors.dart';

class Button extends StatelessWidget {
  final String? textButton;
  final Color? colorButton;
  final Color? textColor;
  final onTap;

  const Button({
    super.key,
    required this.textButton,
    this.colorButton,
    this.onTap,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      // child: Expanded(
        child: Container(
          width: Get.width,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          // margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: BoxDecoration(
            color: colorButton ?? ConstColors.orange,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            textButton!,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor ?? ConstColors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      // ),
    );
  }
}
