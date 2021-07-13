import 'package:fluro/fluro.dart';
import 'package:prox_web/src/commons/router/routes.dart';
import 'package:prox_web/src/modules/order_success/index.dart';
import 'package:prox_web/src/modules/product_list/index.dart';
import 'package:prox_web/src/modules/user_details/profile_screen.dart';

class FluroRouterConfig {
  static setRouter() {
    FluroRouter.appRouter
      ..define(
        "${Routes.PRODUCTS_LIST}/:userId/:catalogId",
        handler: Handler(
          handlerFunc: (context, params) {
            final userId = params['userId']![0];
            final catalogId = params['catalogId']![0];
            return ProductsList(userId: userId, catalogId: catalogId);
          },
        ),
      )
    ..define(Routes.USER_DETAILS, handler: Handler(
      handlerFunc: (context, params) {
        return ProfileScreen();
      },
    ),)
      ..define("${Routes.ORDER_SUCCESS}/:orderId", handler: Handler(
        handlerFunc: (context, params) {
          final orderId = params['orderId']![0];
          return SuccessPage(orderId: orderId);
        },
      ),);
  }
}
