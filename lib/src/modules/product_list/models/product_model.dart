import 'package:json_annotation/json_annotation.dart';
part 'product_model.g.dart';
@JsonSerializable()
class ProductModel{
  String id,name,description,unit,imageUrl;
  int discountPrice,price,quantityAvailable;

  ProductModel(this.id, this.name, this.description,this.unit, this.imageUrl,this.discountPrice,
      this.price, this.quantityAvailable);

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

}