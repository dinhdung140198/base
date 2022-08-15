import 'package:flutter/material.dart';
import 'package:tgs/internal/app_controller.dart';
import 'package:tgs/internal/widgets/lazy_indexed_stack.dart';
import 'package:tgs/pages/home/home_page.dart';
import 'package:tgs/pages/setting/setting_page.dart';
import 'package:tgs/pages/tab2_page/tab2_page.dart';

enum MainTab {
  home('/home'),
  suggestion('/suggestion'),
  setting('/setting');

  const MainTab(this.routePath);

  final String routePath;
}

class MainPage extends StatefulWidget {
  final MainTab tab;

  const MainPage({Key? key, required this.tab}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    setContext(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: LazyIndexedStack(
          index: widget.tab.index,
          children: [
            const HomePage(),
            Tab2Page(text: widget.tab.name),
            const SettingPage(),
          ],
        ),
        bottomNavigationBar: bottomNavigationBar(),
      ),
    );
  }

  BottomNavigationBar bottomNavigationBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: MainTab.home.name.toUpperCase(),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: MainTab.suggestion.name.toUpperCase(),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.settings),
          label: MainTab.setting.name.toUpperCase(),
        ),
      ],
      backgroundColor: Colors.white,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      currentIndex: widget.tab.index,
      type: BottomNavigationBarType.fixed,
      onTap: (index) =>
          appController.router.of(context).go(MainTab.values[index].routePath),
    );
  }
}
