import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:prox_web/src/modules/product_list/models/product_model.dart';

@immutable
class ProductState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class ProductInfoState extends ProductState {
  List<ProductModel> productModel;
  ProductInfoState({required this.productModel});
  @override
  List<Object> get props => [];
}

class CreateOrderForProductsInBulkState extends ProductState {
  List<ProductModel> productModels;
  CreateOrderForProductsInBulkState({required this.productModels});
  @override
  List<Object> get props => [];
}


class AddProductWithQuantityInCartState extends ProductState{
  final int totalProducts;
  AddProductWithQuantityInCartState({required this.totalProducts});
}




class LoadingProductState extends ProductState {
  @override
  List<Object> get props => [];
}
