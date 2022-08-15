import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tgs/data/repository/auth_repository/auth_repository_impl.dart';


class ViewData {
  final List<String>? items;
  final bool loading;

  ViewData({this.items, this.loading = true});

  ViewData copyWith({List<String>? item, bool? mLoading}){
    return ViewData(items: item ?? items, loading: mLoading ?? loading);
  }
}

class Tab1ViewModel extends StateNotifier<AsyncValue<ViewData>>{
  final AuthRepositoryImpl authRepositoryImpl;

  Tab1ViewModel(this.authRepositoryImpl) : super(const AsyncLoading());

  List<String> items = [];
  ViewData? dataState;

  Future<void> init() async {
    await getItems();
  }

  Future<void> getItems() async {
    try{
      await Future.delayed(const Duration(seconds: 1));
      items.addAll(['1', '2', '3', '4']);
      //throw FlutterError('flutter error');
      //appController.dialog.showDefaultDialog(context: mainContext, message: 'init context');
      dataState = ViewData(items: items, loading: false,);
      state = AsyncData(dataState!);
      //await Future.delayed(const Duration(seconds: 1));
      //state = AsyncData(dataState!.copyWith(mLoading: false));
    }
    catch(e){
      state = AsyncError(e.toString());
    }
  }

  void removeItem(int index) {
    items.removeAt(index);
    state = AsyncData(dataState!.copyWith(item: items));
  }
}