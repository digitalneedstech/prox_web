import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prox_web/src/modules/product_list/models/product_model.dart';
import 'package:prox_web/src/modules/product_list/repos/product_repository.dart';
import 'package:prox_web/src/modules/user_details/models/order_model.dart';
import 'package:prox_web/src/modules/user_details/models/profile_model.dart';
import 'package:prox_web/src/modules/user_details/repo/profile_repository.dart';

import 'profile_event.dart';
import 'profile_state.dart';

/*
TODO- Update user model with required new model values instead of null
 */
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository profileRepository;
  final ProductRepository productRepository;
  ProfileBloc(this.profileRepository,this.productRepository) : super(LoadingProfileState());
  late ProfileModel _profileModel;


  ProfileModel get profileModel => _profileModel;

  set profileModel(ProfileModel value) {
    _profileModel = value;
  } //TODO- Make Bloc For this repo and for Patient save
  @override
  Stream<ProfileState> mapEventToState(
      ProfileEvent event,
      ) async* {
    if (event is CreateOrUpdateProfileEvent) {
      yield LoadingProfileState();
      await saveProfileInfo(event.profileModel,event.userId);
      OrderModel orderModel=new OrderModel("", event.profileModel.mobileNumber, event.userId, DateTime.now().toIso8601String(), event.productMaps);
      saveProductInfo(event.userId, orderModel);
      yield CreatedOrUpdatedProfileState(orderModel: orderModel);
    }

    if(event is FetchProfileInfoEvent){
      yield LoadingProfileState();
      if(profileModel==null) {
        DocumentSnapshot snapshot = await getUserProfile(event.userId);
        yield ProfileInfoState(profileModel: ProfileModel.fromJson(
            snapshot.data() as Map<String, dynamic>));
      }
      else{
        yield ProfileInfoState(profileModel:profileModel);
      }
    }
  }

  Future<void> saveProfileInfo(ProfileModel profileModel,String userId) async {
    await profileRepository.updateProfileInfo(userId, profileModel);
  }

  Future<DocumentSnapshot> getUserProfile(String userId)async{
    DocumentSnapshot response=await profileRepository.getProfileInfoById(userId);
    return response;
  }

  Future<void> saveProductInfo(String userId,OrderModel productModel) async {
    await productRepository.createOrderForProductIdsInBulk(userId,productModel);
  }


  Future<void> close() async {
    print("Bloc closed");
    super.close();
  }
}
