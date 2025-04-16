import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                const SizedBox(
                  height: 20,
                ),
                CustomNetworkImage(
                  imageUrl: productEntity.imageUrl!,
                ),
                const SizedBox(
                  height: 5,
                ),
                ListTile(
                  title: Text(
                    productEntity.name,
                    textAlign: TextAlign.right,
                    style: AppStyle.semibold13.copyWith(
                      color: const Color(0xFF0C0D0D),
                    ),
                  ),
                  subtitle: FittedBox(
                      child: RichTextforSubtitle(productEntity: productEntity)),
                  trailing: GestureDetector(
                    onTap: () {
                      context.read<CartCubit>().AddProduct(productEntity);
                    },
                    child:  const CircleAvatar(
                      backgroundColor: AppColor.kPrimaryColor,
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
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
