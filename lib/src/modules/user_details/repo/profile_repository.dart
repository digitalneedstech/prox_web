import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prox_web/src/modules/user_details/models/profile_model.dart';
class ProfileRepository{
  final collectionInstance = FirebaseFirestore.instance.collection('buyers');
  Future<DocumentSnapshot> getProfileInfoById(String id){
    return this.collectionInstance.doc(id).get();
  }

  Future<void> updateProfileInfo(String id,ProfileModel profileModel)async{
    this.collectionInstance.doc(id).set(profileModel.toJson());
  }
}