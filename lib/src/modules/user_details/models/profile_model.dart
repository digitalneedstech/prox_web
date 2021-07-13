
import 'package:json_annotation/json_annotation.dart';
part 'profile_model.g.dart';
@JsonSerializable()
class ProfileModel{
  String name,businessName,address,pinCode,state,deepLinkUrl,mobileNumber;
  bool isDeepLinkCreated;

  ProfileModel(
      this.name, this.businessName, this.address, this.pinCode, this.state,this.deepLinkUrl,this.mobileNumber,this.isDeepLinkCreated);
  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}