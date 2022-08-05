import 'dart:convert';
import 'dart:developer';

import 'package:edgroup/data/api/constants.dart';
import 'package:edgroup/data/api/models/response/auth/login_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthService {

  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  static const SECURE_STORAGE_ITEM_TOKEN = 'token';

  Future<bool> login(
    String username,
    String password,
  ) async {
    log('username: $username, password: $password');

    var response = await http
      .post(
        Uri.parse(ApiConstants.HOST + '/auth/login'),
        body: {
          'username': username,
          'password': password
        },
      );

    log('response: ${response.body}');
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var loginRes = LoginResponse.fromJson(
        json.decode(response.body)
      );

      // tokens come in the format "N|<token>",
      // need to split the string with '|' & take only the latter part.
      var token = loginRes.token.split('|').last;
      _secureStorage.write(
        key: SECURE_STORAGE_ITEM_TOKEN,
        value: token,
      );
      
      return true;
    } else {
      // // If the server did not return a 200 OK response,
      // // then throw an exception.
      // throw Exception('Login failed');
      return false;
    }
  }

  Future<String?> getToken() async {
    return _secureStorage.read(key: SECURE_STORAGE_ITEM_TOKEN);}
  
  Future<bool> isLoggedIn() =>
    _secureStorage.containsKey(key: SECURE_STORAGE_ITEM_TOKEN);

  Future<void> logout() async {
    _secureStorage.delete(key: SECURE_STORAGE_ITEM_TOKEN);
  }
}