
import 'dart:io';
import 'package:uni_pro/core/class/postRequest.dart';
import 'package:uni_pro/core/constant/url.dart';

class SignupData{

  ApiPostRequest apiPostRequest;
  SignupData(this.apiPostRequest);

  postData(String firstName , String lastName ,String email , String password , String confirmPassword , File? imageFile )async
  {
    var response=await apiPostRequest.postRequestWithImage(
      AppUrl.signUpUrl,
      {'first_name':firstName,
      'last_name':lastName,
      'email':email,
      'password':password,
      'password_confirmation':confirmPassword },
       imageFile,
       'image',
        null
      );
     return response.fold(
      (ifLeft) =>ifLeft,
      (ifRight) => ifRight,
    );
  }
}