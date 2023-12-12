import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt currentPage = 0.obs;
  PageController pc = PageController();

  void setCurrentPage(int page) {
    currentPage.value = page;
  }

}
