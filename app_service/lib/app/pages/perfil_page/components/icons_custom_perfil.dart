import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/const_colors.dart';
import '../../../constants/svg_asset.dart';
import '../../home_page/home_controller.dart';

class IconsCustomPerfil extends StatelessWidget {
  String icon;
  String title;
  // final int index;
  // final int currentPage;
  final VoidCallback onTap;
  // final BoxConstraints constraints;

   IconsCustomPerfil({
    Key? key,
    required this.icon,
    required this.title,
    // required this.index,
    // required this.currentPage,
    required this.onTap,
    // required this.constraints,
  }) : super(key: key);
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 20,
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: ConstColors.cutGrey,
                  width: 1,
                ),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgAsset(
                  image: icon,
                  imageH: 24,
                  color: ConstColors.black,
                ),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: ConstColors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
