import 'package:flutter/foundation.dart';
import 'package:tgs/data/repository/auth_repository/auth_repository_impl.dart';
import 'package:tgs/internal/app_controller.dart';

class MainViewModel extends ChangeNotifier {
  MainViewModel(this.authRepositoryImpl);

  final AuthRepositoryImpl authRepositoryImpl;

}