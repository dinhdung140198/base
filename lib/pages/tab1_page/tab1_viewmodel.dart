import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tgs/data/repository/auth_repository/auth_repository_impl.dart';
import 'package:tgs/internal/app_controller.dart';

abstract class ViewState{}

class ViewLoading extends ViewState{}
class ViewError extends ViewState{}
class ViewData extends ViewState{
  final List<String>? items;

  ViewData({this.items});

  ViewData copyWith({List<String>? item}){
    return ViewData(items: item ?? items);
  }
}


class Tab1ViewModel extends StateNotifier<ViewState>{
  final AuthRepositoryImpl authRepositoryImpl;

  Tab1ViewModel(this.authRepositoryImpl) : super(ViewLoading());

  List<String> items = [];
  ViewData? dataState;

  Future<void> init() async {
    await getItems();
  }

  Future<void> getItems() async {
    try{
      await Future.delayed(const Duration(seconds: 1));
      items.addAll(['1', '2', '3', '4']);
      //appController.dialog.showDefaultDialog(context: mainContext, message: 'init context');
      dataState = ViewData(items: items);
      state = dataState!;
    }
    catch(e){
      appController.dialog.showDefaultDialog(context: mainContext, message: e.toString());
    }
  }

  void removeItem(int index){
    items.removeAt(index);
    state = dataState!.copyWith(item: items);
  }
}