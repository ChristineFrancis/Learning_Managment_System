import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_pro/core/constant/color.dart';
import 'package:uni_pro/core/constant/imageasset.dart';

Future<bool> alertExit()
{
  Get.defaultDialog(
    title: 'attention',
    confirm: MaterialButton(onPressed: (){exit(0);} , child: const Text('confirm'),),
    cancel: MaterialButton(onPressed: (){Get.back();} , child: const Text('cancel'),),
  );
  return Future.value(true);
}

Future<bool> alertExitFromQuiz()
{
  Get.defaultDialog(
    title: 'Attention',
    titleStyle: TextStyle(color: AppColor.primaryColor , fontSize: 30 , fontWeight: FontWeight.w500),
    content: Column(
      children: [
        Text("You can't exit from quiz" , style: TextStyle(fontSize: 25),),
        SizedBox(height: 10,),
        Image.asset(ImageAsset.exitFromQuiz , height: 130, width: 130,)
      ],
    )
  );
  return Future.value(true);
}