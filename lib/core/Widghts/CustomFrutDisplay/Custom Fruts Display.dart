import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makani/core/uitels/App_Color.dart';
import '../../../features/Home/peresntation/cubits/cart/cart_cubit_cubit.dart';
import '../../entitys/ProductEntity.dart';
import '../../uitels/App_TextStyle.dart';
import '../custom Url image.dart';
import 'RichTextforSubtitle.dart';

class CustomFrutDisplay extends StatelessWidget {
  const CustomFrutDisplay({
    super.key,
    required this.productEntity,
  });
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: const Color(0xFFF3F5F7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border_outlined),
            ),
          ),
          Positioned.fill(
            child: Column(

              children: [
                Expanded(
                  flex:1,
                  child: SizedBox(
                    height: 20.h,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: CustomNetworkImage(
                    imageUrl: productEntity.imageUrl!,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: ListTile(
                    title: FittedBox(
                      child: Text(
                        productEntity.name,
                        textAlign: TextAlign.right,
                        style: AppStyle.semibold13.copyWith(
                          color: const Color(0xFF0C0D0D),
                        ),
                      ),
                    ),
                    subtitle: FittedBox(
                        child: Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: RichTextforSubtitle(productEntity: productEntity),
                    )),
                    trailing: GestureDetector(
                      onTap: () {
                        context.read<CartCubit>().AddProduct(productEntity);
                      },
                      child: const CircleAvatar(
                        backgroundColor: AppColor.kPrimaryColor,
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
