import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/const_colors.dart';
import 'home_controller.dart';
import 'option_menu.dart';

class BottomMenu extends StatelessWidget {
  final int currentIndex;
  BottomMenu({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth <= 670;
        bool isTablet =
            (constraints.maxWidth > 670) && (constraints.maxWidth < 1024);
        bool isDesktopOrWeb = constraints.maxWidth >= 1024;

        return Container(
          decoration: BoxDecoration(
            color: ConstColors.cutGrey,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          height: 60,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: isDesktopOrWeb
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.spaceAround,
            children: [
              MenuCustomItem(
                constraints: constraints,
                icon: "house",
                // title: "Inicio",
                index: 0,
                currentPage: currentIndex,
                onTap: () {
                  if (1 != currentIndex) {
                    controller.pc.jumpToPage(
                      0,
                    );
                  } else {
                    controller.pc.animateToPage(0,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.ease);
                  }
                },
              ),
              MenuCustomItem(
                constraints: constraints,
                icon: "chat",
                title: "Meus Serviços",
                index: 1,
                currentPage: currentIndex,
                onTap: () {
                  if (0 != currentIndex && 2 != currentIndex) {
                    controller.pc.jumpToPage(
                      1,
                    );
                  } else {
                    controller.pc.animateToPage(1,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.ease);
                  }
                },
              ),
              MenuCustomItem(
                constraints: constraints,
                icon: "user",
                // title: "Perfil",
                index: 2,
                currentPage: currentIndex,
                onTap: () {
                  if (1 != currentIndex && 2 != currentIndex) {
                    controller.pc.jumpToPage(
                      2,
                    );
                  } else {
                    controller.pc.animateToPage(2,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.ease);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
