import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tgs/internal/app_controller.dart';
import 'package:tgs/internal/router/route_utils.dart';
import 'package:tgs/internal/utils/style.dart';
import 'package:tgs/pages/common_widget/info_item.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          '設定',
          style: AppTextStyle.bold.copyWith(
            fontSize: 30,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30,),
        child: Column(
          children: [
            const SizedBox(height: 50,),
            InfoItem(
              title: '基本情報、プロフィール',
              onTap: () => toDetail(),
            ),
            InfoItem(
              title: '休憩アラーム',
              onTap: () => toDetail(),
            ),
          ],
        ),
      ),
    );
  }

  void toDetail(){
    appController.router.of(context).pushNamed(
      AppPage.infoDetail.name,
    );
  }
}
