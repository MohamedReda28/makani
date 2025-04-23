import 'package:dartz/dartz.dart';

import '../../entitys/ProductEntity.dart';
import '../../erroes/Failur.dart';


abstract class ProductRepo {
  Future<Either<Failur, List<ProductEntity>>> getProduct();
  Future<Either<Failur, List<ProductEntity>>> getSomeBestSellingProduct();
  Future<Either<Failur, List<ProductEntity>>> getAllBestSellingProduct();
}
