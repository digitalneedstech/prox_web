import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prox_web/src/modules/product_list/bloc/product_event.dart';
import 'package:prox_web/src/modules/product_list/bloc/product_state.dart';
import 'package:prox_web/src/modules/product_list/models/product_model.dart';
import 'package:prox_web/src/modules/product_list/repos/product_repository.dart';

/*
TODO- Update user model with required new model values instead of null
 */
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;

  ProductBloc(this.productRepository) : super(LoadingProductState());
  List<ProductModel> _productModels=[];
  List<ProductModel> get productModels => _productModels;
  set productModels(List<ProductModel> value) {
    _productModels = value;
  }

  late Map<String, int> _productsInCart;


  Map<String, int> get productsInCart => _productsInCart;

  set productsInCart(Map<String, int> value) {
    _productsInCart = value;
  }

  late String _userId;
  String get userId => _userId;
  set userId(String value) {
    _userId = value;
  }

  @override
  Stream<ProductState> mapEventToState(
      ProductEvent event,
      ) async* {
    if (event is CreateOrderForProductsInBulkEvent) {
      yield LoadingProductState();
      userId=event.userId;
      yield CreateOrderForProductsInBulkState(productModels: productModels);
    }
    if(event is AddProductWithQuantityInCartEvent){
      if(!productsInCart.containsKey(event.productId)){
        productsInCart[event.productId]=event.quantity;
      }
      else{
        int val=productsInCart[event.productId]!;
        productsInCart[event.productId]=val++;
      }
      productModels=List.from(productsInCart.keys.toList());
      AddProductWithQuantityInCartState(totalProducts: productsInCart.keys.toList().length);
    }

    if(event is FetchProductInfoEvent){
      yield LoadingProductState();
      QuerySnapshot snapshot = await getProductByIdAndCatalogId(event.userId,event.catalogId);
      List<ProductModel> productsList = [];
      for (DocumentSnapshot document in snapshot.docs) {
        productsList.add(
            ProductModel.fromJson(document.data() as Map<String, dynamic>));
      }
      yield ProductInfoState(productModel: productsList);
    }
  }

  Future<QuerySnapshot> getProductByIdAndCatalogId(String catalogId,String userId)async{
    QuerySnapshot response=await productRepository.getProductByIdAndCatalogId(catalogId,userId);
    return response;
  }

  Future<void> close() async {
    print("Bloc closed");
    super.close();
  }
}
