import 'dart:convert';
import 'package:http/http.dart' as http;

import 'endpoints.dart';

class ApiServices {
  var isloading = false;

  _setHeaders() =>
      {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

  login(data) async {
    var url = ApiConstants.baseUrl + ApiConstants.login;
    var fullUrl = Uri.parse(url);
    final encoding = Encoding.getByName('utf-8');

    try {
      http.Response response = await http.post(
        fullUrl,
        body: jsonEncode(data),
        headers: _setHeaders(),
        encoding: encoding,
      );

      if (response.statusCode == 200) {
        return (response);
      } else {
        return 'Failed';
      }
    } catch (e) {
     // return e.toString();
      return 'Failed';
    }
  }

  signup(data, suffix) async {
    var url = ApiConstants.baseUrl + suffix;
    var fullUrl = Uri.parse(url);
    final encoding = Encoding.getByName('utf-8');

    try {
      http.Response response = await http.post(
        fullUrl,
        body: jsonEncode(data),
        headers: _setHeaders(),
        encoding: encoding,
      );

      if (response.statusCode == 200) {
        return (response);
      } else {
        return 'Failed';
      }
    } catch (e) {
     // return e.toString();
      return 'Failed';
    }
  }

  signup_patient(data){
    return signup(data, ApiConstants.signup_patient);
  }

  signup_doctor(data){
    return signup(data, ApiConstants.signup_doctor);
  }

  signup_hospital(data){
    return signup(data, ApiConstants.signup_hospital);
  }
  signup_pharmacy(data){
    return signup(data, ApiConstants.signup_pharmacy);
  }

  forget_password(data) async {
    var url = ApiConstants.baseUrl + ApiConstants.forget_password;
    var fullUrl = Uri.parse(url);
    final encoding = Encoding.getByName('utf-8');

    try {
      http.Response response = await http.post(
        fullUrl,
        body: jsonEncode(data),
        headers: _setHeaders(),
        encoding: encoding,
      );

      if (response.statusCode == 200) {
        return (response);
      } else {
        return 'Failed';
      }
    } catch (e) {
     // return e.toString();
      return 'Failed';
    }
  }

  edit_profile(data) async {
    var url = ApiConstants.baseUrl + ApiConstants.account;
    var fullUrl = Uri.parse(url);
    final encoding = Encoding.getByName('utf-8');

    try {
      http.Response response = await http.post(
        fullUrl,
        body: jsonEncode(data),
        headers: _setHeaders(),
        encoding: encoding,
      );

      if (response.statusCode == 200) {
        return (response);
      } else {
        return 'Failed';
      }
    } catch (e) {
     // return e.toString();
      return 'Failed';
    }
  }

  userroutes(data) async {
    var url = ApiConstants.baseUrl + ApiConstants.user_route;
    var fullUrl = Uri.parse(url);
    final encoding = Encoding.getByName('utf-8');

    try {
      http.Response response = await http.post(
        fullUrl,
        body: jsonEncode(data),
        headers: _setHeaders(),
        encoding: encoding,
      );

      if (response.statusCode == 200) {
        return (response);
      } else {
        return 'Failed';
      }
    } catch (e) {
     // return e.toString();
      return 'Failed';
    }
  }
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