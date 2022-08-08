import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tgs/viewmodel/login_vm.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer(
          builder: (context, ref, __) {
            final loginVM = ref.read(loginViewModel);

            return TextButton(
              onPressed: () {
                loginVM.login();
              },
              child: const Text("Login"),
            );
          }
        ),
      ),
    );
  }
}
