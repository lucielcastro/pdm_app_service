import 'package:flutter/material.dart';
import '../const_colors.dart';

class TextMoney extends StatelessWidget {
  final String textMoney;
  final Color? color;
  final double? fontSize;

  const TextMoney({
    super.key,
    required this.textMoney,
    this.color,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "R\$ $textMoney",
      style: TextStyle(
        color: color ?? ConstColors.orange,
        fontWeight: FontWeight.w400,
        fontSize: fontSize ?? 18,
      ),
    );
  }
}
