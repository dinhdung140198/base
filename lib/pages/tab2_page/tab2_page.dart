import 'package:flutter/material.dart';
import 'package:tgs/pages/home/layout/result_layout.dart';

class Tab2Page extends StatelessWidget {
  final String text;
  const Tab2Page({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResultLayout();
  }
}
