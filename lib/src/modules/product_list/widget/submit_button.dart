import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prox_web/src/modules/product_list/bloc/product_bloc.dart';
import 'package:prox_web/src/modules/product_list/bloc/product_event.dart';
import 'package:prox_web/src/modules/product_list/bloc/product_state.dart';

class SubmitButton extends StatelessWidget {
  final String userId;
  SubmitButton({required this.userId});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is AddProductWithQuantityInCartState) {
          if (state.totalProducts == 0) {
            return _renderSubmitButton(context, "Save");
          }
          return _renderSubmitButton(context, "Save ${state.totalProducts}");
        } else {
          return _renderSubmitButton(context, "Save");
        }
      },
    );
  }

  RaisedButton _renderSubmitButton(BuildContext context, String text) {
    return RaisedButton(
      onPressed: () {
        BlocProvider.of<ProductBloc>(context)
            .add(CreateOrderForProductsInBulkEvent(userId: userId));
      },
      padding: const EdgeInsets.all(10.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      child: Center(
        child: Text(text),
      ),
      color: Colors.green,
      textColor: Colors.white,
    );
  }
}
