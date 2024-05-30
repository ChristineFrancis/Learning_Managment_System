import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:uni_pro/core/constant/routes.dart';
import 'package:uni_pro/data/datasource/static/static.dart';


abstract class OnBoardingController extends GetxController {
  next();
  onPagechanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  late PageController pageController;
  int currentpage = 0;
  @override
  next() {
    currentpage++;
    if (currentpage > onBoardingList.length - 1) {
     Get.offAllNamed(AppRoute.signup);
    } else {
      pageController.animateToPage(currentpage,
          duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }

  @override
  onPagechanged(int index) {
    currentpage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
