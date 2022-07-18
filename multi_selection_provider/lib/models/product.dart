import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title;
  final IconData iconData;

  const Product(this.id, this.title, this.iconData);
}

// sample data
List<Product> productList = [
  Product(1, 'hifispeaker', CupertinoIcons.hifispeaker),
  Product(2, 'tv', CupertinoIcons.tv),
  Product(3, 'umbrella', CupertinoIcons.umbrella),
  Product(4, 'rocket', CupertinoIcons.rocket),
  Product(5, 'car', CupertinoIcons.car),
];
