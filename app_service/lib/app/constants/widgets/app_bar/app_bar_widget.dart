import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../const_colors.dart';
import '../../image_asset.dart';
import '../../svg_asset.dart';
import '../buttons/text_icon.dart';

class AppBarWidget extends StatelessWidget {
  final String icon;
  final onTap;
  const AppBarWidget({
    super.key,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.topCenter,
      width: Get.width,
      // width: 200,
      decoration: const BoxDecoration(
        color: ConstColors.white,
      ),
      // margin: const EdgeInsets.symmetric(vertical: 10),
      // padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // if (showButton)
          InkWell(
            onTap: onTap,
            child: SvgAsset(
              image: icon,
              color: ConstColors.black,
            ),
          ),
          const ImageAsset(
            image: 'logo-main',
            imageH: 100,
          ),
        ],
      ),
    );
  }
}
