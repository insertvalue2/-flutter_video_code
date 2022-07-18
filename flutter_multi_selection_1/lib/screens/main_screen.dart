import 'package:flutter/material.dart';
import '../models/product.dart';

import 'item.dart';
import 'pick_item_title.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Product> pickItems = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('multi-selection'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 130,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  // add sample data
                  ...List.generate(
                    productList.length,
                    (index) => Item(
                      product: productList[index],
                      onSelected: (bool value) {
                        if (value) {
                          pickItems.add(productList[index]);
                        } else {
                          pickItems.remove(productList[index]);
                        }
                        // pass Function
                        setState(() {});
                      },
                    ),
                  )
                ],
              ),
            ),
            // add title
            Container(
              padding: const EdgeInsets.all(16.0),
              height: 100,
              width: double.infinity,
              child: Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                children: [
                  ...List.generate(
                    pickItems.length,
                    (index) => PickItemTitle(
                      title: pickItems[index].title,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
