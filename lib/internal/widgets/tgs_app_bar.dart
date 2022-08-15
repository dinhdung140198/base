import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tgs/generated/l10n.dart';
import 'package:tgs/internal/utils/style.dart';

class TgsAppBar extends StatefulWidget {
  final String? title;
  final Function()? leadingOnTap;
  const TgsAppBar({Key? key, this.title,this.leadingOnTap,}) : super(key: key);

  @override
  State<TgsAppBar> createState() => _TgsAppBarState();
}

class _TgsAppBarState extends State<TgsAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      shadowColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      leading: TextButton(
        onPressed: widget.leadingOnTap,
        child: Text(
          S.of(context).back,
          style: AppTextStyle.normal.copyWith(color: Colors.blue,fontSize: 16,),
        ),
      ),
      title: Text(
        widget.title ?? '設定',
        style: AppTextStyle.bold.copyWith(
          fontSize: 30,
        ),
      ),
    );
  }
}
