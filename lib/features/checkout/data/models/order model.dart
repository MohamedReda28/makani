
import '../../domines/entitys/Order_Entity.dart';
import 'AddressOrder_model.dart';
import 'orderProductModel.dart';

class OrderModel {
  final double totalPrice;
  final String uID;
  final AddressOrderModel addressOrderModel;
  final List<Orderproductmodel> orderProductModel;
  final String payMethod;

  OrderModel(
      {required this.totalPrice,
      required this.uID,
      required this.addressOrderModel,
      required this.orderProductModel,
      required this.payMethod});

  factory OrderModel.fromOEntity(OrderInputEntity orderEntity) {
    return OrderModel(
      totalPrice: orderEntity.cartList.CalculteTotlePrice(),
      uID: orderEntity.uID,
      addressOrderModel:
          AddressOrderModel.fromEntity(orderEntity.addressOrderentity),
      payMethod: orderEntity.paywithCash! ? 'Cach' : 'Paypal',
      orderProductModel: orderEntity.cartList.carsItems
          .map((e) => Orderproductmodel.fromEntity(e))
          .toList(),
    );
  }

  toJson() {
    return {
      'totalPrice': totalPrice,
      'uID': uID,
      'status':'pending',
      'date':DateTime.now().toString(),
      'addressOrderModel': addressOrderModel.toJson(),
      'orderProductModel': orderProductModel.map((e) => e.toJson()).toList(),
      'payMethod': payMethod
    };
  }
}
