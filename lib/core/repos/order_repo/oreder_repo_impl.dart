import 'package:dartz/dartz.dart';
import '../../../features/checkout/data/models/order model.dart';
import '../../../features/checkout/domines/entitys/Order_Entity.dart';
import '../../erroes/Failur.dart';
import '../../services/services/DataBase_Serveces.dart';
import '../../uitels/backend Impoint.dart';
import 'order_reop.dart';

class OrederRepoImpl implements OrderRepo {
  final DataBaseServeces dataBaseServeces;
  OrederRepoImpl({required this.dataBaseServeces});
  @override
  Future<Either<Failur, void>> addOrder(OrderInputEntity orderEntity) async {
    try {
      var order = OrderModel.fromOEntity(orderEntity);
      await dataBaseServeces.addData(
          path: BackEndImpoint.addOrders,
          documentId:order.oID ,
          data: order.toJson());
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
