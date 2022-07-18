import '../models/product.dart';
import 'package:flutter/material.dart';

import 'item_card.dart';

class ItemList extends StatelessWidget {
  final List<Product> categoryProduct;

  const ItemList({Key key, this.categoryProduct}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: categoryProduct
          .map((e) => ItemCard(
                product: e,
              ))
          .toList(),
    );
  }
}
