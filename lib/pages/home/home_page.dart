import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tgs/generated/l10n.dart';
import 'package:tgs/internal/utils/app_helper.dart';
import 'package:tgs/internal/utils/style.dart';
import 'package:tgs/internal/widgets/app_button.dart';
import 'package:tgs/internal/widgets/percent_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double _radius = 150;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        leading: TextButton(
          onPressed: () {},
          child: Text(
            S.of(context).back,
            style: AppTextStyle.normal.copyWith(color: Colors.blue,fontSize: 16,),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.grey91,),
          gradient: const LinearGradient(
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
            const SizedBox(height: 18,),
            CircularPercentIndicator(
              radius: _radius,
              lineWidth: 10,
              percent: 0.2,
              startAngle: 360,
              center: Container(
                height: (_radius-10)*2,
                width: (_radius-10)*2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.circleIndicatorGreen,
                  border: Border.all(color: Colors.greenAccent, width: 1.5,),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(Icons.bed_outlined, color: Colors.white, size: 48,),
                    Text(
                      '睡眠',
                      style: AppTextStyle.bold.copyWith(fontSize: 64, color: Colors.white),
                    ),
                    Text(
                      '6h',
                      style: AppTextStyle.bold.copyWith(fontSize: 50, color: Colors.white),
                    ),
                  ],
                ),
              ),
              backgroundColor: Colors.white,
              progressColor: AppColors.grey174,
              //circularStrokeCap: CircularStrokeCap.round,
            ),
            const Spacer(),
            _buildContent(),
            const SizedBox(height: 16,),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: AppButton(
                height: 60,
                radius: 60,
                fontSize: 25,
                textButton: S.of(context).next.toUpperCase(),
                textColor: Colors.white,
                buttonColor: AppColors.greenButton,
                borderColor: Colors.transparent,
              ),
            ),
            const SizedBox(height: 18,),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(){
    const String text = 'text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text';
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.white255.withOpacity(0.6),
      ),
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30,),
      child: Column(
        children: [
         const SizedBox(height: 18,),
          Text(
            S.of(context).homeTitle,
            style: AppTextStyle.normal.copyWith(fontSize: 18),
          ),
          const SizedBox(height: 26,),
          Text(
            text,
            textAlign: TextAlign.center,
            style: AppTextStyle.normal.copyWith(fontSize: 18,),
          ),
        ],
      ),
    );
  }
}
