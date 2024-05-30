import 'package:uni_pro/core/class/postRequest.dart';
import 'package:uni_pro/core/constant/url.dart';


class LoginData{

  ApiPostRequest apiPostRequest;
  LoginData(this.apiPostRequest);

  postData( String email , String password )async
  {
    var response=await apiPostRequest.postRequest(AppUrl.loginUrl,
     {
      'email':email,
      'password':password,
    }, null);
    return response.fold((l) => l, (r) => r);

  }
}