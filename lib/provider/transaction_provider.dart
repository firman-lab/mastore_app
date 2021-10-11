import 'package:flutter/cupertino.dart';
import 'package:mastore_app/models/cart_model.dart';
import 'package:mastore_app/services/transaction_service.dart';

class TransactionProvider with ChangeNotifier {
  Future<bool> checkout(
      String token, List<CartModel> cart, double totalPrice) async {
    try {
      if (await TransactionService().checkout(token, cart, totalPrice)) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
