import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prox_web/src/commons/router/routes.dart';
import 'package:prox_web/src/modules/product_list/bloc/product_bloc.dart';
import 'package:prox_web/src/modules/product_list/bloc/product_event.dart';
import 'package:prox_web/src/modules/product_list/bloc/product_state.dart';
import 'package:prox_web/src/modules/product_list/models/product_model.dart';
import 'package:prox_web/src/modules/product_list/widget/product_item.dart';
import 'package:prox_web/src/modules/product_list/widget/submit_button.dart';

class ProductsList extends StatelessWidget {
  final String userId, catalogId;
  ProductsList({required this.userId, required this.catalogId});
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProductBloc>(context)
        .add(FetchProductInfoEvent(userId: userId, catalogId: catalogId));
    return BlocListener<ProductBloc, ProductState>(
      listener: (context, state) {
        if (state is CreateOrderForProductsInBulkState) {
          _scaffoldKey.currentState!.showSnackBar(SnackBar(
            content: Text("Products are added"),
            backgroundColor: Colors.green,
          ));
          Future.delayed(Duration(seconds: 2), () {
            Navigator.popAndPushNamed(context, "${Routes.USER_DETAILS}");
          });
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("Product"),
          centerTitle: true,
        ),
        body: ListView(children: [
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductInfoState) {
                if (state.productModel.isEmpty) {
                  return Center(child: Text("No Product is Available"));
                } else {
                  ListView(
                    shrinkWrap: true,
                    children: [
                      ListView.builder(
                        itemBuilder: (context, int index) {
                          ProductModel model = state.productModel[index];
                          return ProductItem(
                              model: model,
                              callback: (String productId, int quantity) {
                                BlocProvider.of<ProductBloc>(context).add(
                                    AddProductWithQuantityInCartEvent(
                                        productId: productId,
                                        quantity: quantity));
                              });
                        },
                        itemCount: state.productModel.length,
                        padding: const EdgeInsets.all(10.0),
                      ),
                    ],
                  );
                }
              }
              return Center(child: Text("Loading....."));
            },
          ),
          SubmitButton(userId: userId)
        ]),
      ),
    );
  }
}
