import 'package:equatable/equatable.dart';
import 'package:prox_web/src/modules/product_list/models/product_model.dart';
import 'package:prox_web/src/modules/user_details/models/profile_model.dart';

class ProfileEvent extends Equatable {
  @override
  List<Object> get props => [];
}


class FetchProfileInfoEvent extends ProfileEvent{
  String userId;
  FetchProfileInfoEvent({required this.userId});
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}

class CreateOrUpdateProfileEvent extends ProfileEvent{
  final ProfileModel profileModel;
  final String userId;
  final Map<String,int> productMaps;
  CreateOrUpdateProfileEvent({required this.profileModel,required this.userId,required this.productMaps});
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
