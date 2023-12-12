import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/const_colors.dart';
import '../../constants/svg_asset.dart';
import 'home_controller.dart';

class MenuCustomItem extends StatelessWidget {
  String icon;
  final String? title;
  final int index;
  final int currentPage;
  final VoidCallback onTap;
  final BoxConstraints constraints;

  MenuCustomItem({
    Key? key,
    required this.icon,
    this.title,
    required this.index,
    required this.currentPage,
    required this.onTap,
    required this.constraints,
  }) : super(key: key);
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    bool isMobile = constraints.maxWidth <= 670;
    bool isTablet =
        (constraints.maxWidth > 670) && (constraints.maxWidth < 1024);
    bool isDesktopOrWeb = constraints.maxWidth >= 1024;
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 80,
            height: 80,
            color: Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgAsset(
                  image: icon,
                  imageH: 24,
                  color: currentPage == index
                      ? ConstColors.white
                      : ConstColors.black,
                ),
                // const SizedBox(height: 8),
                // if (isMobile)
                //   Text(title!,
                //       style: TextStyle(
                //           fontSize: 12,
                //           fontWeight: currentPage == index
                //               ? FontWeight.bold
                //               : FontWeight.normal,
                //           color: currentPage == index
                //               ? ConstColors.black
                //               : ConstColors.black)),
              ],
            ),
          ),
          if (isDesktopOrWeb || isTablet)
            Text(title!,
                style: TextStyle(
                    fontSize: currentPage == index ? 24 : 20,
                    fontWeight: currentPage == index
                        ? FontWeight.bold
                        : FontWeight.normal,
                    color: currentPage == index
                        ? Colors.black
                        : Colors.black)),
        ],
      ),
    );
  }
}
