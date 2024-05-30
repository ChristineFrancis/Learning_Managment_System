import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:uni_pro/core/class/postRequest.dart';
import 'package:uni_pro/core/constant/routes.dart';
import 'package:uni_pro/routes.dart';
import 'package:uni_pro/services/services.dart';

void main() async{
   Get.put(ApiPostRequest());
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Exo2', 
        useMaterial3: true,
      ),
      initialRoute:AppRoute.splash ,
      getPages: routes,
    );
  }
}



