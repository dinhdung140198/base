import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tgs/data/repository/auth_repository/auth_repository_impl.dart';
import 'package:tgs/internal/router/app_router.dart';
import 'package:tgs/pages/authen/login/login_viewmodel.dart';

final loginViewModel = Provider<LoginViewModel>((ref) {
  final auth = ref.read(authRepositoryImpl);
  final loginState = ref.read(stateProvider.notifier);

  return LoginViewModel(auth, loginState);
});