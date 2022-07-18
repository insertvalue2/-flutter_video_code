import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_selection_provider/models/product.dart';
import 'package:multi_selection_provider/widgets/item.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Ver Provider 5',
          style: TextStyle(
            fontSize: 40.0,
            color: Colors.orange[200],
          ),
        ),
        const SizedBox(height: 20.0),
        Container(
          height: 130.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              productList.length,
              (index) => Item(
                product: productList[index],
              ),
            ),
          ),
        )
      ],
    );
  }
}
