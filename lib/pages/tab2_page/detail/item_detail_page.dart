import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:tgs/internal/app_controller.dart';
import 'package:tgs/internal/router/route_utils.dart';
import 'package:tgs/internal/utils/app_extension.dart';
import 'package:tgs/internal/utils/style.dart';
import 'package:tgs/model/item_detail.dart';

class ItemDetailPage extends StatefulWidget {
  final String id;
  const ItemDetailPage({Key? key, required this.id}) : super(key: key);

  @override
  State<ItemDetailPage> createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  final List<ItemDetail> items = [
    ItemDetail(
      title: '朝',
      description: 'お知らせ概要＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊',
      createDate: DateTime(2022, 07, 12, 08, 45),
    ),
    ItemDetail(
      title: '朝',
      description: 'お知らせ概要＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊',
      createDate: DateTime(2022, 07, 11, 18, 00),
    ),
    ItemDetail(
      title: '朝',
      description: 'お知らせ概要＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊',
      createDate: DateTime(2022, 07, 12, 12, 00),
    ),
    ItemDetail(
      title: 'タイトル3',
      description: 'お知らせ概要＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊',
      createDate: DateTime(2022, 07, 12),
    ),
    ItemDetail(
      title: 'タイトル4',
      description: 'お知らせ概要＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊',
      createDate: DateTime(2022, 07, 12),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'お知らせ一覧',
          style: AppTextStyle.bold.copyWith(
            fontSize: 30,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 62,
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 30, right: 30),
              itemCount: items.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 14),
                  child: Item(
                    detail: items[index],
                    onTap: () => toDetail(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void toDetail(int id){
    appController.router.of(context).pushNamed(
      AppPage.detail3.name,
      params: {
        AppPage.detail2.params: widget.id,
        AppPage.detail3.params: id.toString(),
      }
    );
  }
}

class Item extends StatelessWidget {
  final ItemDetail detail;
  final Function()? onTap;
  const Item({Key? key, required this.detail, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                detail.title,
                style: AppTextStyle.bold.copyWith(fontSize: 16),
              ),
              const Spacer(),
              Text(
                detail.createDate.toDisplayJapanType,
                style: AppTextStyle.normal.copyWith(fontSize: 10),
              ),
              const SizedBox(
                width: 5,
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 20,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              detail.description,
              textAlign: TextAlign.start,
              maxLines: null,
              style: AppTextStyle.normal.copyWith(fontSize: 16),
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const Divider(
            color: Colors.black,
            height: 1,
          ),
        ],
      ),
    );
  }
}
