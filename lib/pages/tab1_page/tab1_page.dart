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
          final stateNotifier = ref.read(tab1ViewModel.notifier);
          final state = ref.watch(tab1ViewModel);
          final listData = ref.watch(tab1ViewModel).value?.items;

          ref.listen<AsyncValue<ViewData>>(tab1ViewModel, (_, listenState) {
            listenState.whenOrNull(
              error: (e, __) => appController.dialog.showDefaultDialog(
                context: context,
                message: e.toString(),
              ),
            );
          });

          return state.maybeWhen(
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            error: (e, _) => Center(child: Text(e.toString(),),),
            orElse: () => const Center(
              child: Text('Error'),
            ),
            data: (viewData) => viewData.loading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.red,
                    ),
                  )
                : ListData(
                    items: listData,
                    onTap: (index) => stateNotifier.removeItem(index),
                  ),
          );
        },
      ),
    );
  }

  void toDetail(context, int id) {
    appController.router.of(context).pushNamed(
      AppPage.detail1.name,
      params: {
        AppPage.detail1.params: id.toString(),
      },
    );
  }
}

class ListData extends StatelessWidget {
  final List<String>? items;
  final Function(int)? onTap;

  const ListData({Key? key, this.items, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items!.length,
      padding: const EdgeInsets.only(left: 10, right: 10),
      itemBuilder: (item, index) {
        return InkWell(
          onTap: () => onTap!(index),
          child: Container(
            key: ValueKey<String>('$index'),
            height: 300,
            width: double.maxFinite,
            margin: const EdgeInsets.only(top: 20),
            color: index.isEven ? Colors.blue : Colors.red,
            child: Center(
              child: Text(
                items![index],
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
}
