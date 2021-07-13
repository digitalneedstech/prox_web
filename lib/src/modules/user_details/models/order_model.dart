import 'package:json_annotation/json_annotation.dart';
part 'order_model.g.dart';
@JsonSerializable()
class OrderModel{
  String id,createdBy,createdFor,createdAt;
  Map<dynamic,dynamic> productIds;

  OrderModel(this.id, this.createdBy, this.createdFor, this.createdAt,this.productIds);

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$OrderModelToJson(this);

}