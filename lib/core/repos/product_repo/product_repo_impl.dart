import 'package:dartz/dartz.dart';
import 'package:makani/core/repos/product_repo/product_repo.dart';
import '../../entitys/ProductEntity.dart';
import '../../erroes/Failur.dart';
import '../../models/productModel.dart';
import '../../services/services/DataBase_Serveces.dart';
import '../../uitels/backend Impoint.dart';


class productRepoImpl implements ProductRepo {
  final DataBaseServeces dataBaseServeces;
  productRepoImpl({required this.dataBaseServeces});
  @override
  Future<Either<Failur, List<ProductEntity>>> getBestSellingProduct() async {
    try {
      var data = await dataBaseServeces
          .getData(path: BackEndImpoint.getproducts, query: {
        'limit': 10,
        'orderBy': 'sellingcount',
        'descending': true,
      }) as List<Map<String, dynamic>>;

      List<ProductModel> products =
          data.map((e) => ProductModel.fromJson(e)).toList();
      List<ProductEntity> productEntit =
          products.map((e) => e.toEntity()).toList();
      return right(productEntit);
    } catch (e) {
      return left(ServerFailure('Failed to load products'));
    }
  }

  @override
  Future<Either<Failur, List<ProductEntity>>> getProduct() async {
    try {
      var data = await dataBaseServeces.getData(
          path: BackEndImpoint.getproducts) as List<Map<String, dynamic>>;

      List<ProductModel> products =
          data.map((e) => ProductModel.fromJson(e)).toList();
      List<ProductEntity> productEntit =
          products.map((e) => e.toEntity()).toList();
      return right(productEntit);
    } catch (e) {
      return left(ServerFailure('Failed to load products'));
    }
  }
}
