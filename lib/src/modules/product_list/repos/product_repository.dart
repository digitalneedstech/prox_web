import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prox_web/src/modules/product_list/models/product_model.dart';
import 'package:prox_web/src/modules/user_details/models/order_model.dart';

class ProductRepository {
  final userCollectionInstance = FirebaseFirestore.instance.collection('users');
  final catalogCollectionInstance = FirebaseFirestore.instance.collection('catalog');
  final productCollectionInstance = FirebaseFirestore.instance.collection('product');
  Future<QuerySnapshot> getProductByIdAndCatalogId(
      String catalogId,String userId) {
    return this
        .userCollectionInstance
        .doc(userId)
        .collection("catalog")
        .doc(catalogId)
        .collection("product")
        .get();
  }

  createOrderForProductIdsInBulk(String userId,OrderModel order) {
    this.userCollectionInstance.doc(userId).collection("orders").add(
        order.toJson());
  }
}
