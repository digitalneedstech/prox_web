import 'package:equatable/equatable.dart';
import 'package:prox_web/src/modules/product_list/models/product_model.dart';

class ProductEvent extends Equatable {
  @override
  List<Object> get props => [];
}


class FetchProductInfoEvent extends ProductEvent{
  String userId,catalogId;
  FetchProductInfoEvent({required this.userId,required this.catalogId});
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}

class CreateOrderForProductsInBulkEvent extends ProductEvent{
  final String userId;
  CreateOrderForProductsInBulkEvent({required this.userId});
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class AddProductWithQuantityInCartEvent extends ProductEvent{
  final String productId;
  final int quantity;
  AddProductWithQuantityInCartEvent({required this.productId,required this.quantity});
}
