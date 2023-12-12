import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/const_colors.dart';
import '../../../constants/svg_asset.dart';
import '../../../constants/text/text_title.dart';

class HeaderPayments extends StatelessWidget {
  final String text;

  const HeaderPayments({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: const BoxDecoration(
        color: ConstColors.white,
      ),
      margin: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => Get.back(),
            child: const SvgAsset(
              image: "angle_left",
              color: ConstColors.black,
            ),
          ),
          const SizedBox(width: 15),
          TextTitle(
            textTitle: text,
          ),
        ],
      ),
    );
  }
}
