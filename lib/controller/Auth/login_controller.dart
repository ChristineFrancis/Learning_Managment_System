
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_pro/core/class/statusrequest.dart';
import 'package:uni_pro/core/constant/routes.dart';
import 'package:uni_pro/core/constant/url.dart';
import 'package:uni_pro/core/functions/checkinternet.dart';
import 'package:uni_pro/core/functions/handlingdata.dart';
import 'package:uni_pro/data/datasource/remote/auth/logindata.dart';
import 'package:uni_pro/services/services.dart';
import 'package:http/http.dart' as http;

abstract class LoginController extends GetxController with GetTickerProviderStateMixin
 { 
  login();
  showPassword();
  toggleAnimation();
  logout();
 }

 class LoginControllerImp extends LoginController{
  AnimationController? animationController;
  LoginData loginData=LoginData(Get.find());
   StatusRequest statusRequest=StatusRequest.none;
   MyServices myServices=Get.find();

   GlobalKey<FormState> formState=GlobalKey<FormState>();
   late TextEditingController email;
   late TextEditingController password;
   bool isShowPassword=true;
   IconData suffixIconAuth=Icons.visibility_off_outlined;
  final isPlaying = false.obs;



  @override
  void onInit() {
    animationController = AnimationController(
       vsync: this, duration: const Duration(milliseconds: 1000));
    animationController?.repeat();


    email=TextEditingController();
    password=TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

   @override
  void toggleAnimation() {
    isPlaying.toggle();
    isPlaying.value ? animationController?.forward() : animationController?.stop();
  }
  
  @override
  login() async{
    var formData = formState.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();

      try {
        var response = await loginData.postData( email.text, password.text );
         statusRequest = handlingData(response);
        if (statusRequest == StatusRequest.success) 
        {
          if (response['message'] == 'Student logged in successfully.')
           {
             String accessToken=response['access_token'];
              print('access_tokeeeeeeen login $accessToken');
               myServices.sharedPreferences.setString('access_token' , accessToken );
              Get.defaultDialog(title: 'Welcome', content: Text(response['message']));
              Future.delayed(const Duration(seconds:2), () {
            if (Get.isDialogOpen ?? false) {
           Get.back();
            }  });
           Future.delayed(const Duration(seconds:2), () {
            myServices.sharedPreferences.setBool('canGoToHome', true);
             Get.offAllNamed(AppRoute.navbar);
          });
           }
           else if (response['message'] == 'Validation error') {
            String errorMessages = '';
            if (response['errors'] != null) {
              response['errors'].forEach((key, value) {
                errorMessages += value.join('\n') + '\n';
              });
            }
            Get.defaultDialog(title: response['message'], content: Text(errorMessages.isNotEmpty ? errorMessages : 'An error occurred.'));
            statusRequest = StatusRequest.failure;
          } else {
            Get.defaultDialog(title: 'Warning', content: Text(response['message'] ?? 'An error occurred.'));
            statusRequest = StatusRequest.failure;
          }
        } 
      } catch (e) {
        statusRequest = StatusRequest.failure;
        Get.defaultDialog(title: 'Error', content: Text('An error occurred: $e'));
      }
      update();
    }
  }

  
  @override
  showPassword() {
    if(isShowPassword==true)
    {
      isShowPassword=false;
       suffixIconAuth=Icons.visibility_outlined;
      update();
    }

    else if(isShowPassword==false)
    {
      isShowPassword=true;
      suffixIconAuth=Icons.visibility_off_outlined;
      update();
    }

  }
  
  @override
  logout() async
  {
     statusRequest = StatusRequest.loading;
      update();
      String? token=myServices.sharedPreferences.getString('access_token');
    try
    {
      if (await checkInternet()) {
       Map<String, String> headers = 
       {'Accept': 'application/json',
        'Authorization': 'Bearer $token'
       };
        Uri url=Uri.parse(AppUrl.logOutUrl);
       http.Response response = await http.get(url, headers: headers );
       Map responseBody = jsonDecode(response.body);
       print(responseBody);
        statusRequest = handlingData(response);
         if (statusRequest == StatusRequest.success) 
         {
           Get.defaultDialog(title: responseBody['message'], content: Text(''));
           myServices.sharedPreferences.clear();
           Future.delayed(const Duration(seconds:2), () {
            if (Get.isDialogOpen ?? false) {
           Get.back();
            }  });
           Future.delayed(const Duration(seconds:2), () {
             Get.toNamed(AppRoute.login);
          });
         }

      }
       else
     {
      StatusRequest.offlineFailure;
      update();
    }
    }
    catch (e) {
      // ignore: avoid_print
      print('error when getting data logout $e');}

    
  }
}
