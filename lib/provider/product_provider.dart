import 'package:flutter/material.dart';
import 'package:mastore_app/models/product_model.dart';
import 'package:mastore_app/services/product_service.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _products = [];
  List<ProductModel> _searchs = [];

  List<ProductModel> get products => _products;
  List<ProductModel> get searchs => _searchs;

  set products(List<ProductModel> products) {
    _products = products;
    notifyListeners();
  }

  set searchs(List<ProductModel> searchs) {
    _searchs = searchs;
    notifyListeners();
  }

  Future<void> getProducts() async {
    try {
      List<ProductModel> products = await ProductService().getProducts();
      _products = products;
      // print(_products);
    } catch (e) {
      print(e);
    }
  }

  filterProduct(String searchText) {
    List<ProductModel> search = _products
        .where((e) => e.name!.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
    _searchs = search;
    print(search);
    notifyListeners();

    // return search;
    // notifyListeners();
  }
}
