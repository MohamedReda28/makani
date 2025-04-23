import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../constsns.dart';
import '../../../../../core/Widghts/CustomAppbar2.dart';
import '../../../../../core/Widghts/customErrorWidght.dart';
import '../../../../../core/cubits/product_cubit/product_cubit_cubit.dart';
import '../../../../../core/helpes_function/git_dammy_Product.dart';
import 'CustomTextFiledForSearch.dart';
import 'ProductsGridview.dart';
import 'ProductsGridviewBlocBuilder.dart';
import 'ProdutviewResult.dart';

class ProdutViewBody extends StatefulWidget {
  const ProdutViewBody({super.key});
  @override
  State<ProdutViewBody> createState() => _ProdutViewBodyState();
}

class _ProdutViewBodyState extends State<ProdutViewBody> {
  void initState() {
    context.read<ProductCubit>().getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(builder: (context, state) {
      if (state is ProductCubitSuccess) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: kTopPadding,
                    ),
                    const CustomAppbar2(
                      title: 'المنتجات',
                      visableArw: false,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const CustomTextFiledForSearch(),
                    const SizedBox(
                      height: 12,
                    ),
                    ProdutviewResult(
                        productleanth: state.productLength!),
                    const SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              ),
               const ProductsGridviewBlocBuilder(),
            ],
          ),
        );
      } else if (state is ProductCubitFailure) {
        return Customerrorwidght(
          text: state.message,
        );
      } else {
        return Skeletonizer.sliver(
          enabled: true,
          child: ProductsGridview(
            products: getDomyProducts(),
          ),
        );
      }
    });
  }
}

