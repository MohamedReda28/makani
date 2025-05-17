import 'package:equatable/equatable.dart';

import '../../../../core/entitys/ProductEntity.dart';


class CartItemEntity extends Equatable {
  final ProductEntity productEntity;
  int quantity;

  CartItemEntity({required this.productEntity, this.quantity = 0});

  num CalculteTotlePrice() {
    return productEntity.price * quantity;
  }

  num CalculteTotleWeight() {

    return double.parse(productEntity.unitAmount) * quantity;
  }

  increaseQuantity() {
    quantity++;
  }

  decreaseQuantity() {
    quantity--;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [productEntity];
}
