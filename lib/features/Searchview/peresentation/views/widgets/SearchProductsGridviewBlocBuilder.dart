import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makani/features/Searchview/peresentation/views/maneger/cubit/search_product_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../core/Widghts/customErrorWidght.dart';
import '../../../../../core/helpes_function/git_dammy_Product.dart';
import '../../../../../core/uitels/app_images.dart';
import '../../../../Home/peresntation/views/widgets/ProductsGridview.dart';

class SearchProductsGridviewBlocBuilder extends StatelessWidget {
  const SearchProductsGridviewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchProductCubit, SearchProductState>(
        builder: (context, state) {
      if (state is SearchProductInitial) {
        // لو المستخدم ما كتبش حاجة
        return SliverToBoxAdapter(
          child: Column(children: [
            Image.asset(Assets.imagesSearch),
            const Text(
              'ابدأ بالبحث عن منتج!',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ]),
        );
      }
      if (state is SearchProductSuccess) {
        return ProductsGridview(products: state.products);
      } else if (state is SearchProductFaluir) {
        return Customerrorwidght(
          text: state.errorMessage,
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
