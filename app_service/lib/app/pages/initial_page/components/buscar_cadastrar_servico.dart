import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/const_colors.dart';
import '../../../constants/svg_asset.dart';

class BuscarCadastrarServico extends StatelessWidget {
  final String text;
  final String image;
  final width;
  final onTap;

  const BuscarCadastrarServico({
    super.key,
    required this.text,
    required this.image,
    this.onTap,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        width: width ?? Get.width,
        height: 55,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
            border: Border.all(color: ConstColors.backgroundGrey, width: 2),
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgAsset(
              image: image,
              color: ConstColors.orange,
            ),
            const SizedBox(width: 20),
            Text(
              text,
              style: const TextStyle(
                color: ConstColors.black,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//width
