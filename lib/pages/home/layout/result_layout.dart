import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tgs/internal/app_controller.dart';
import 'package:tgs/internal/router/route_utils.dart';
import 'package:tgs/internal/utils/app_helper.dart';
import 'package:tgs/internal/utils/style.dart';
import 'package:tgs/model/user_point.dart';

class ResultLayout extends StatefulWidget {
  const ResultLayout({Key? key}) : super(key: key);

  @override
  State<ResultLayout> createState() => _ResultLayoutState();
}

class _ResultLayoutState extends State<ResultLayout> {
  final List<UserPoint> listPoint = [
    UserPoint(title: '適度な休憩', description: '定期的に遠くを見て目を休める', point: 2),
    UserPoint(title: '十分な睡眠', description: '**時間以上の睡眠をとる', point: 10),
    UserPoint(title: '部屋を明るくする', description: 'PCやスマホを使用する場合、部屋を明るくする。', point: 20),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: FractionalOffset.bottomCenter,
            end: FractionalOffset.topCenter,
            tileMode: TileMode.repeated,
            stops: [0.0, 1.0],
            colors: [
              AppColors.gradientGreenStart,
              AppColors.gradientGreenEnd,
            ],
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: AppHelper.statusBarHeight(context),),
            Text(
              '目に良い行動',
              style: AppTextStyle.bold.copyWith(
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 150,),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(left: 30, right: 30,),
                itemCount: listPoint.length,
                itemBuilder: (_, index) {
                  return SuggestItem(
                    item: listPoint[index],
                    onTap: () => toDetail(index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void toDetail(int index){
    appController.router.of(context).pushNamed(
      AppPage.detail2.name,
      params: {
        AppPage.detail2.params: index.toString(),
      },
    );
  }
}

class SuggestItem extends StatelessWidget {
  final UserPoint item;
  final Function? onTap;
  const SuggestItem({Key? key, required this.item,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap!(),
      splashColor: Colors.transparent,
      child: Container(
        height: 110,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.only(left: 10, right: 15, bottom: 10, top: 10),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: AppTextStyle.bold.copyWith(
                      fontSize: 18,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      item.description,
                      style: AppTextStyle.normal.copyWith(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20,),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 20,
                ),
                const SizedBox(height: 5,),
                Transform.rotate(
                  angle: pi/4,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.green110,
                    ),
                    child: Center(
                      child: Transform.rotate(
                        angle: -pi/4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              item.point.toString(),
                              style: AppTextStyle.bold.copyWith(fontSize: 26,),
                            ),
                            Text(
                              'point',
                              style: AppTextStyle.normal.copyWith(fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}




