import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:uni_pro/core/constant/routes.dart';
import 'package:uni_pro/middleware/middleware.dart';
import 'package:uni_pro/view/screen/Auth/check_email.dart';
import 'package:uni_pro/view/screen/Auth/forget_password.dart';
import 'package:uni_pro/view/screen/Auth/login.dart';
import 'package:uni_pro/view/screen/Auth/reset_password.dart';
import 'package:uni_pro/view/screen/Auth/sign_up.dart';
import 'package:uni_pro/view/screen/curved_NavigationBar.dart';
import 'package:uni_pro/view/screen/onboarding.dart';
import 'package:uni_pro/view/screen/splash.dart';

List<GetPage<dynamic>> routes=
[
  GetPage(name: AppRoute.signup, page:()=> const SignUpPage()),
  GetPage(name: AppRoute.login, page:()=> LoginPage()),
  GetPage(name: AppRoute.checkEmail, page:()=> const CheckEmailPage()),
  GetPage(name: AppRoute.onboarding, page:()=> OnBoarding()),
  GetPage(name: AppRoute.navbar, page:()=> Curved_NB()),
  GetPage(name: AppRoute.forgetPassword, page:()=> const ForgetPasswordPage()),
  GetPage(name: AppRoute.resetPassword, page:()=> ResetPasswordPage()),
  GetPage(name: AppRoute.splash, page:()=> Splash_Screen() ,  middlewares: [MyMiddleware() ]), 
];