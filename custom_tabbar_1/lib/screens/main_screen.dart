import '../components/header.dart';

import '../components/item_list.dart';
import '../models/product.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentSelection = 1;
  double _selectorPositonX = 16.0;
  final double _selectorWidth = 30;

  GlobalKey _key1 = GlobalKey();
  GlobalKey _key2 = GlobalKey();
  GlobalKey _key3 = GlobalKey();

  _selectedItem(int id) {
    _currentSelection = id;
    // setup key
    GlobalKey selectedGlobalKey;
    switch (id) {
      case 1:
        selectedGlobalKey = _key1;
        break;
      case 2:
        selectedGlobalKey = _key2;
        break;
      case 3:
        selectedGlobalKey = _key3;
        break;
      default:
    }

    // need funtion
    _setWidgetPositionX(selectedGlobalKey);
    setState(() {});
  }

  _setWidgetPositionX(GlobalKey selectedKey) {
    final RenderBox widgetRenderBox =
        selectedKey.currentContext.findRenderObject();
    final widgetPositon = widgetRenderBox.localToGlobal(Offset.zero);
    final widgetSize = widgetRenderBox.size;

    // _selectorPositonX = widgetPositon.dx;
    _selectorPositonX =
        widgetPositon.dx - ((_selectorWidth - widgetSize.width) / 2);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _setWidgetPositionX(_key1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Custom Tabbar'),
      ),
      body: ListView(
        children: [
          Header(),
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 16.0, bottom: 12.0),
                child: Row(
                  children: [
                    InkWell(
                      key: _key1,
                      onTap: () => _selectedItem(1),
                      child: Text(
                        'One',
                        style: TextStyle(
                          color: _currentSelection == 1
                              ? Colors.blue
                              : Colors.grey,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12.0),
                    InkWell(
                      key: _key2,
                      onTap: () => _selectedItem(2),
                      child: Text(
                        'Two',
                        style: TextStyle(
                          color: _currentSelection == 2
                              ? Colors.blue
                              : Colors.grey,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12.0),
                    InkWell(
                      key: _key3,
                      onTap: () => _selectedItem(3),
                      child: Text(
                        'Three',
                        style: TextStyle(
                          color: _currentSelection == 3
                              ? Colors.blue
                              : Colors.grey,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 400),
                curve: Curves.fastOutSlowIn,
                left: _selectorPositonX,
                bottom: 4.0,
                child: Container(
                  width: _selectorWidth,
                  height: 4.0,
                  decoration: ShapeDecoration(
                    shape: StadiumBorder(),
                    color: Colors.orange[200],
                  ),
                ),
              ),
            ],
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            child: ItemList(
              key: ValueKey(_currentSelection),
              categoryProduct: productList
                  .where(
                    (element) => element.category == _currentSelection,
                  )
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
