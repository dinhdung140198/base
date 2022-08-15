import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tgs/internal/utils/app_helper.dart';
import 'package:tgs/internal/utils/style.dart';
import 'package:tgs/internal/widgets/app_button.dart';
import 'package:tgs/internal/widgets/app_input_text_field.dart';
import 'package:tgs/viewmodel/login_vm.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();



  @override
  void dispose() {
    emailController.dispose();
    emailFocusNode.dispose();

    passwordController.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () => AppHelper.hideKeyboard(context),
        splashColor: Colors.transparent,
        child: SafeArea(
          bottom: false,
          child: Center(
            child: Consumer(
              builder: (context, ref, __) {
                final loginVM = ref.read(loginViewModel);

                return Padding(
                  padding: const EdgeInsets.only(left: 35, right: 35),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Wellcome back!',
                        style: AppTextStyle.bold.copyWith(fontSize: 22),
                      ),
                      const SizedBox(height: 35,),
                      AppInputTextField.email(
                        controller: emailController,
                        focusNode: emailFocusNode,
                        labelText: 'Email',
                        onChanged: (input){
                          debugPrint('email:$input');
                        },
                      ),
                      const SizedBox(height: 20,),
                      AppInputTextField.password(
                        controller: passwordController,
                        focusNode: passwordFocusNode,
                        suffixIcon: const Icon(
                          Icons.remove_red_eye,
                          color: Colors.black,
                        ),
                        labelText: 'Password',
                        onChanged: (input){
                          debugPrint('password:$input');
                        },
                        onSummited: (text){

                        },
                      ),

                      const SizedBox(height: 25,),

                      AppButton(
                        textButton: 'Login',
                        onTap: () => loginVM.login(),
                      )
                    ],
                  ),
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}
