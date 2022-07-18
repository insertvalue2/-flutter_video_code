import 'package:flutter/material.dart';
import 'package:multi_selection_provider/models/my_item.dart';
import 'package:multi_selection_provider/widgets/item.dart';
import 'package:provider/provider.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // use provider
    var myItem = Provider.of<MyItem>(context);
    int count = myItem.length;
    return Center(
      child: count != 0
          ? Wrap(
              children: myItem.selectedList
                  .map(
                    (e) => Item(
                      product: e,
                    ),
                  )
                  .toList(),
            )
          : Text(
              'No chioce',
              style: TextStyle(fontSize: 30.0),
            ),
    );
  }
}
