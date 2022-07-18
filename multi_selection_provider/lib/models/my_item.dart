import 'package:flutter/material.dart';
import 'package:multi_selection_provider/models/product.dart';

class MyItem with ChangeNotifier {
  List<Product> _myItems = [];

  int get length => _myItems.length;
  List<Product> get selectedList => _myItems;

  void add(Product product) {
    _myItems.add(product);
    notifyListeners();
  }

  void remove(Product product) {
    _myItems.remove(product);
    notifyListeners();
  }

  bool hasProduct(Product product) {
    return _myItems.where((element) => element.id == product.id).isNotEmpty;
  }
}
