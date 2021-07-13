// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return ProductModel(
    json['id'] as String,
    json['name'] as String,
    json['description'] as String,
    json['unit'] as String,
    json['imageUrl'] as String,
    json['discountPrice'] as int,
    json['price'] as int,
    json['quantityAvailable'] as int,
  );
}

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'unit': instance.unit,
      'imageUrl': instance.imageUrl,
      'discountPrice': instance.discountPrice,
      'price': instance.price,
      'quantityAvailable': instance.quantityAvailable,
    };
