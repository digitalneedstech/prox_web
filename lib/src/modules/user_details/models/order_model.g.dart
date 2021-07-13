// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) {
  return OrderModel(
    json['id'] as String,
    json['createdBy'] as String,
    json['createdFor'] as String,
    json['createdAt'] as String,
    json['productIds'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdBy': instance.createdBy,
      'createdFor': instance.createdFor,
      'createdAt': instance.createdAt,
      'productIds': instance.productIds,
    };
