
import 'dart:io';

import 'package:uni_pro/core/class/postRequest.dart';
import 'package:uni_pro/core/constant/url.dart';

class ResetPasswordData{

  ApiPostRequest apiPostRequest;
  ResetPasswordData(this.apiPostRequest);

  postData(String email , String password )async
  {
    var response=await apiPostRequest.postRequest(
      AppUrl.resetPassword,
      {
      'email':email,
      'password':password,}
      ,null

      );
     return response.fold(
      (ifLeft) =>ifLeft,
      // {'status': 'error', 'message': 'Network error'},
      (ifRight) => ifRight,
    );
  }
}