import 'package:flutter/material.dart';
import '../models/product.dart';

class Item extends StatefulWidget {
  final Product product;
  final ValueChanged<bool> onSelected;

  const Item({
    Key key,
    this.product,
    this.onSelected,
  }) : super(key: key);

  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
          // callback
          widget.onSelected(_isSelected);
        });
      },
      child: Container(
        margin: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: _isSelected
                    ? Border.all(
                        width: 2.0,
                        color: Colors.orange[100],
                      )
                    : null,
              ),
              child: Icon(
                // product -> widget
                widget.product.iconData,
                size: 32.0,
              ),
            ),
            SizedBox(height: 12.0),
            Text(
              widget.product.title,
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
