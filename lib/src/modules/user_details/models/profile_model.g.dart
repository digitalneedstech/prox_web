// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) {
  return ProfileModel(
    json['name'] as String,
    json['businessName'] as String,
    json['address'] as String,
    json['pinCode'] as String,
    json['state'] as String,
    json['deepLinkUrl'] as String,
    json['mobileNumber'] as String,
    json['isDeepLinkCreated'] as bool,
  );
}

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'businessName': instance.businessName,
      'address': instance.address,
      'pinCode': instance.pinCode,
      'state': instance.state,
      'deepLinkUrl': instance.deepLinkUrl,
      'mobileNumber': instance.mobileNumber,
      'isDeepLinkCreated': instance.isDeepLinkCreated,
    };
