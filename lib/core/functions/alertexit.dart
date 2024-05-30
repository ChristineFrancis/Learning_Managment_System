import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExit()
{
  Get.defaultDialog(
    title: 'attention',
    confirm: MaterialButton(onPressed: (){exit(0);} , child: const Text('confirm'),),
    cancel: MaterialButton(onPressed: (){Get.back();} , child: const Text('cancel'),),
  );
  return Future.value(true);
}