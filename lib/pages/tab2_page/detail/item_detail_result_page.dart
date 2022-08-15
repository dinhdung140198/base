import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tgs/generated/l10n.dart';
import 'package:tgs/internal/utils/style.dart';
import 'package:tgs/internal/widgets/app_button.dart';
import 'package:tgs/internal/widgets/percent_indicator.dart';

class ItemDetailResultPage extends StatefulWidget {
  final String id;
  const ItemDetailResultPage({Key? key, required this.id}) : super(key: key);

  @override
  State<ItemDetailResultPage> createState() => _ItemDetailResultPageState();
}

class _ItemDetailResultPageState extends State<ItemDetailResultPage> {
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
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            S.of(context).back,
            style: AppTextStyle.normal.copyWith(color: Colors.blue,fontSize: 16,),
          ),
        ),
        title: Text(
          '適度な休憩',
          style: AppTextStyle.bold.copyWith(
            fontSize: 30,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(18),
        margin: const EdgeInsets.fromLTRB(30, 30, 30, 70),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.grey91,),
          color: Colors.white,
        ),
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTopContent(),
        const SizedBox(height: 26,),
        Divider(color: Colors.black.withOpacity(0.5),height: 2,),
        const SizedBox(height: 46,),
        Text(
          '豆知識',
          style: AppTextStyle.bold.copyWith(
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 18,),
        Text(
          '暗い場所では人の目は少しでもたくさんの光を取り入れようと瞳孔が開くようにできています。 逆に本を読んだり、近くのものを見るとき、目は瞳孔を縮めようとします。 反対の動きをすることで目が緊張して疲れ、視力低下の直接の原因ではなくても一因になりえます。 明るさが足りないときは手元を照らすライトなどで調節しましょう。 パソコンのディスプレイは手元の白い紙と比べて同じくらいの明るさになるよう調節しましょう。 \n\n●スマホ・パソコンを使う部屋の明るさ ・パソコンの作業…300～500ルクス \n●読書・勉強する部屋の明るさ ・勉強や読書…500～1000ルクス',
          textAlign: TextAlign.start,
          style: AppTextStyle.normal.copyWith(
            fontSize: 16,
            color: AppColors.grey102,
          ),
        ),
      ],
    );
  }

  Widget _buildTopContent(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'トレンド',
          style: AppTextStyle.bold.copyWith(fontSize: 20),
        ),
        const SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.only(left: 10,),
          child: Text(
            '今週は先週に比べ上向き傾向です。',
            textAlign: TextAlign.start,
            style: AppTextStyle.normal.copyWith(fontSize: 16),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15,top: 22,),
          child: Text(
            '休憩間隔',
            textAlign: TextAlign.start,
            style: AppTextStyle.normal.copyWith(fontSize: 16),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildRichText(
                normalFirstText: '先週',
                specialText: '90',
                normalLastText: '分',
                textColor: AppColors.textColor,
              ),
              _buildRichText(
                normalFirstText: '今週',
                specialText: '75',
                normalLastText: '分',
                textColor: AppColors.specialRed,
              )
            ],
          ),
        ),
      ],
    );
  }


  Widget _buildRichText({String? normalFirstText, String? specialText,String? normalLastText, Color? textColor}){
    return Text.rich(
      TextSpan(
        children: [
          WidgetSpan(
            child: Transform.translate(
              offset: const Offset(0.0, -7.0),
              child:  Text(
                normalFirstText ?? 'Text',
                style: AppTextStyle.normal.copyWith(fontSize: 24, color: textColor ?? AppColors.textColor,),
              ),
            ),
          ),
          TextSpan(
            text: specialText,
            style: AppTextStyle.bold.copyWith(fontSize: 46, color: textColor ?? AppColors.specialRed,),
          ),
          WidgetSpan(
            child: Transform.translate(
              offset: const Offset(0.0, -7.0),
              child:  Text(
                normalLastText ?? 'Text',
                style: AppTextStyle.normal.copyWith(fontSize: 24, color: textColor ?? AppColors.textColor,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
