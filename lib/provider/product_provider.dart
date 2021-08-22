import 'package:flutter/material.dart';
import 'package:mastore_app/models/product_model.dart';
import 'package:mastore_app/services/auth_service.dart';
import 'package:mastore_app/services/product_service.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _products = [];

  List<ProductModel> get products => _products;

  set products(List<ProductModel> products) {
    _products = products;
    notifyListeners();
  }

  Future<void> getProducts() async {
    try {
      List<ProductModel> products = await ProductService().getProducts();
      _products = products;
    } catch (e) {
      print(e);
    }
  }
}
