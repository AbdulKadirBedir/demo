import 'package:facebook_project/auth/authentication_service.dart';
import 'package:flutter/material.dart';

class AuthenticationNotifier extends ChangeNotifier {
  final AuthenticationService authenticationService =
      new AuthenticationService();

  Future<String> signup({
    String name,
    String confirmpassword,
    String email,
    String password,
  }) async {
    try {
      await authenticationService.signup(email: email, password: password);
    } catch (e) {
      print(e);
    }
  }

  Future<String> login({
    String email,
    String password,
  }) async {
    try {
      await authenticationService.login(email: email, password: password);
    } catch (e) {
      print(e);
    }
  }
}
