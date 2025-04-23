import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../entitys/ProductEntity.dart';
import '../../repos/product_repo/product_repo.dart';
part 'product_cubit_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.productRepo) : super(ProductCubitInitial());
  final ProductRepo productRepo;
  int productLength = 0;

  Future<void> getProducts() async {
    emit(ProductCubitLoading());
    final result = await productRepo.getProduct();

    result.fold(
          (failure) => emit(ProductCubitFailure(failure.message)),
          (products) {
        productLength += products.length;
        emit(ProductCubitSuccess(products, productLength: productLength ));
      },
    );
  }



  Future<void> getSomeBestSellingProduct() async {
    emit(ProductCubitLoading());
    final result = await productRepo.getSomeBestSellingProduct();
    result.fold((failur) => emit(ProductCubitFailure(failur.message)),
        (products) {
      emit(ProductCubitSuccess(products,));

    });
  }

  Future<void> getAllBestSellingProduct() async {
    emit(ProductCubitLoading());
    final result = await productRepo.getAllBestSellingProduct();
    result.fold((failur) => emit(ProductCubitFailure(failur.message)),
            (products) {
          emit(ProductCubitSuccess(products,));

        });
  }
}
