import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:prox_web/src/modules/user_details/models/order_model.dart';
import 'package:prox_web/src/modules/user_details/models/profile_model.dart';

@immutable
class ProfileState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class ProfileInfoState extends ProfileState {
  ProfileModel profileModel;
  ProfileInfoState({required this.profileModel});
  @override
  List<Object> get props => [];
}

class CreatedOrUpdatedProfileState extends ProfileState {
  OrderModel orderModel;
  CreatedOrUpdatedProfileState({required this.orderModel});
  @override
  List<Object> get props => [];
}

class LoadingProfileState extends ProfileState {
  @override
  List<Object> get props => [];
}
