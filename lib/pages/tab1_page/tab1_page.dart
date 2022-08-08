import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tgs/internal/app_controller.dart';
import 'package:tgs/internal/router/route_utils.dart';
import 'package:tgs/pages/tab1_page/tab1_viewmodel.dart';
import 'package:tgs/viewmodel/tab1_vm.dart';

class Tab1Page extends StatefulWidget {
  const Tab1Page({Key? key}) : super(key: key);

  @override
  State<Tab1Page> createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page> {


  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Consumer(
        builder: (_, ref, __) {
          final stateNotifier = ref.watch(tab1ViewModel.notifier);
          final state = ref.watch(tab1ViewModel);

          if(state is ViewLoading){
            return const Center(child: CircularProgressIndicator());
          }
          else if(state is ViewError){
            return const Center(child: Text('Error'));
          }
          else if( state is ViewData){
            return ListView.builder(
              itemCount: state.items!.length,
              padding: const EdgeInsets.only(left: 10, right: 10),
              itemBuilder: (item, index) {
                return InkWell(
                  onTap: () => toDetail(context, index),//stateNotifier.removeItem(index),
                  child: Container(
                    key: ValueKey<String>('$index'),
                    height: 300,
                    width: double.maxFinite,
                    margin: const EdgeInsets.only(top: 20),
                    color: index.isEven ? Colors.blue : Colors.red,
                    child: Center(
                      child: Text(
                        state.items![index],
                        style: const TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }

          return const SizedBox.shrink();
        }
      ),
    );
  }

  void toDetail(context, int id){
    appController.router.of(context).pushNamed(
      AppPage.detail1.name,
      params: {
        AppPage.detail1.params: id.toString(),
      },
    );
  }
}
