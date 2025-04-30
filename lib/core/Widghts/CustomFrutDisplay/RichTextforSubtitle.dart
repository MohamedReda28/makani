import 'package:flutter/material.dart';
import '../../entitys/ProductEntity.dart';
import '../../uitels/App_Color.dart';
import '../../uitels/App_TextStyle.dart';

class RichTextforSubtitle extends StatelessWidget {
  const RichTextforSubtitle({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '${productEntity.price} جنيه',
            style: AppStyle.bold28.copyWith(
              color: AppColor.secondColor,
            ),
          ),
          TextSpan(
            text: '  الكيلو',
            style:
                AppStyle.semibold16.copyWith(color: AppColor.lightsecondColor),
          ),
        ],
      ),
      //textAlign: TextAlign.right,
    );
  }
}
