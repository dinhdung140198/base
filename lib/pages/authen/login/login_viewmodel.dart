
import 'package:flutter/material.dart';
import 'package:tgs/data/repository/auth_repository/auth_repository_impl.dart';
import 'package:tgs/internal/app_controller.dart';
import 'package:tgs/internal/router/app_router.dart';

class LoginViewModel {
  final AuthRepositoryImpl authRepositoryImpl;
  final LoggedInState loggedInState;

  LoginViewModel(this.authRepositoryImpl, this.loggedInState);

  Future<void> login() async {
    appController.loading.show();
    try{
      await Future.delayed(const Duration(seconds: 2));
      //final user = await authRepositoryImpl.login(email: '', password: '', deviceToken: '');
      appController.loading.hide();
      loggedInState.login();
    }
    catch (e){
      debugPrint('exception: ${e.toString()}');
      appController.loading.hide();
    }
  }
}