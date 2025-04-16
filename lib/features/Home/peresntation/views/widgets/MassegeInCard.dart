import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makani/core/uitels/App_Color.dart';
import '../../../../../core/uitels/App_TextStyle.dart';
import '../../cubits/cart/cart_cubit_cubit.dart';

class Massegeincard extends StatelessWidget {
  const Massegeincard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 41,
      padding: const EdgeInsets.symmetric(horizontal: 91, vertical: 10),
      clipBehavior: Clip.antiAlias,
      decoration:  BoxDecoration(color: AppColor.lightPrimaryColor),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'لديك ${context.watch<CartCubit>().cartEntity.carsItems.length} منتجات في سله التسوق',
            style: AppStyle.bold13.copyWith(
              color:  Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
