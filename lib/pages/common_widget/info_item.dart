import 'package:flutter/material.dart';
import 'package:tgs/internal/utils/style.dart';

class InfoItem extends StatelessWidget {
  final String? title;
  final Function()? onTap;
  const InfoItem({Key? key, this.title,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          splashColor: Colors.transparent,
          child: Column(
            children: [
              const SizedBox(height: 18,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title ?? 'Title',
                    style: AppTextStyle.normal.copyWith(fontSize: 16),
                  ),
                  const Icon(Icons.arrow_forward_ios, size: 20,),
                ],
              ),
              const SizedBox(height: 18,),
            ],
          ),
        ),
        const Divider(color: AppColors.grey102,),
      ],
    );
  }
}
