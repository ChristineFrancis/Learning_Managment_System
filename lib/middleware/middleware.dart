import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';
import 'package:uni_pro/core/constant/routes.dart';
import 'package:uni_pro/services/services.dart';


class MyMiddleware extends GetMiddleware
{
   MyServices myServices=Get.find();
  // @override
  // int? get priority =>1;
  @override
  RouteSettings? redirect(String? route) {
    bool? canGoToHome=myServices.sharedPreferences.getBool('canGoToHome');
    if( canGoToHome==true) {
      return const RouteSettings(name: AppRoute.navbar);
    }
    return null;
  }
}