import 'package:flutter/material.dart';
import 'package:multi_selection_provider/models/my_item.dart';
import 'package:multi_selection_provider/models/product.dart';
import 'package:provider/provider.dart';

class Item extends StatelessWidget {
  final Product product;

  const Item({
    Key key,
    this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // use Provider
    var myItem = Provider.of<MyItem>(context);
    var isSelected = myItem.hasProduct(product);

    return GestureDetector(
      onTap: () {
        if (isSelected) {
          myItem.remove(product);
        } else {
          myItem.add(product);
        }
      },
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.all(16.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: isSelected
                  ? Border.all(width: 2.0, color: Colors.green)
                  : null,
            ),
            child: Icon(
              product.iconData,
              size: 30.0,
            ),
          ),
          const SizedBox(height: 12.0),
          Text(product.title)
        ],
      ),
    );
  }
}
