import 'dart:convert';

import 'package:dio/dio.dart';

import 'endpoints.dart';

class ApiServices {
  var isloading = false;
  Dio _dio = Dio();


  login(data) async {
    var url = ApiConstants.baseUrl + ApiConstants.login;
    try {
      Response response = await _dio.post(
        url,
        queryParameters : data,
        options: Options(
          contentType: Headers.jsonContentType,
        ),
      );
      if (response.data["user"] != null && response.data["rtn"].toString().isEmpty) return (response);
      else return "Login failed, ${response.data["rtn"]}";
    } catch (e) {
      return "Connection failed, ${e}";
    }
  }

  signup(data, suffix) async {
    var url = ApiConstants.baseUrl + suffix;
    print('${url}---===---');
    Map<String, dynamic> rtn;
    try {
      Response response = await _dio.post(
        url,
        queryParameters : data,
        options: Options(
          contentType: Headers.jsonContentType,
        ),
      );
      if (response.data["rtn"].toString().isEmpty && response.data["reg"] == "1") {
        print('"success');
        return (response);
      }else{
        print('failleddd --0${response.data}');
        return "Signup failed, ${response.data["rtn"]}";
      }

    } catch (e) {
      print('catched ---=-009 ${e}');

      return "Connection failed, ${e}";
    }
  }

  signup_patient(data){
    return signup(data, ApiConstants.signup_patient);
  }
  //
  // signup_doctor(data){
  //   return signup(data, ApiConstants.signup_doctor);
  // }
  //
  // signup_hospital(data){
  //   return signup(data, ApiConstants.signup_hospital);
  // }
  // signup_pharmacy(data){
  //   return signup(data, ApiConstants.signup_pharmacy);
  // }
  //
  // forget_password(data) async {
  //   var url = ApiConstants.baseUrl + ApiConstants.forget_password;
  //   var fullUrl = Uri.parse(url);
  //   final encoding = Encoding.getByName('utf-8');
  //
  //   try {
  //     http.Response response = await http.post(
  //       fullUrl,
  //       body: jsonEncode(data),
  //       headers: _setHeaders(),
  //       encoding: encoding,
  //     );
  //
  //     if (response.statusCode == 200) {
  //       return (response);
  //     } else {
  //       return 'Failed';
  //     }
  //   } catch (e) {
  //    // return e.toString();
  //     return 'Failed';
  //   }
  // }
  //
  // edit_profile(data) async {
  //   var url = ApiConstants.baseUrl + ApiConstants.account;
  //   var fullUrl = Uri.parse(url);
  //   final encoding = Encoding.getByName('utf-8');
  //
  //   try {
  //     http.Response response = await http.post(
  //       fullUrl,
  //       body: jsonEncode(data),
  //       headers: _setHeaders(),
  //       encoding: encoding,
  //     );
  //
  //     if (response.statusCode == 200) {
  //       return (response);
  //     } else {
  //       return 'Failed';
  //     }
  //   } catch (e) {
  //    // return e.toString();
  //     return 'Failed';
  //   }
  // }
  //
  // userroutes(data) async {
  //   var url = ApiConstants.baseUrl + ApiConstants.user_route;
  //   var fullUrl = Uri.parse(url);
  //   final encoding = Encoding.getByName('utf-8');
  //
  //   try {
  //     http.Response response = await http.post(
  //       fullUrl,
  //       body: jsonEncode(data),
  //       headers: _setHeaders(),
  //       encoding: encoding,
  //     );
  //
  //     if (response.statusCode == 200) {
  //       return (response);
  //     } else {
  //       return 'Failed';
  //     }
  //   } catch (e) {
  //    // return e.toString();
  //     return 'Failed';
  //   }
  // }
  //
  // checkpayment(order_id) async {
  //   var url = ApiConstants.baseUrl + ApiConstants.check_payment + "?order_id="+order_id.toString();
  //   var fullUrl = Uri.parse(url);
  //   final encoding = Encoding.getByName('utf-8');
  //
  //   try {
  //     http.Response response = await http.get(
  //       fullUrl,
  //      // body: "",
  //       headers: _setHeaders(),
  //     //  encoding: encoding,
  //     );
  //
  //     if (response.statusCode == 200) {
  //       return (response);
  //     } else {
  //       return 'Failed';
  //     }
  //   } catch (e) {
  //    // return e.toString();
  //     return 'Failed';
  //   }
  // }
}