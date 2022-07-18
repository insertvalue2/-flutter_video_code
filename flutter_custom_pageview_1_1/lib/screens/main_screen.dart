import 'package:flutter/material.dart';
import '../models/appbanner.dart';
import 'banner_item.dart';

import 'indicator.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Custom PageView'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16.0),
            height: 160,
            child: PageView.builder(
              onPageChanged: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              controller: PageController(viewportFraction: 0.7),
              itemCount: appBannerList.length,
              itemBuilder: (context, index) {
                var banner = appBannerList[index];
                var _scale = _selectedIndex == index ? 1.0 : 0.8;

                return TweenAnimationBuilder(
                  duration: const Duration(milliseconds: 350),
                  tween: Tween(begin: _scale, end: _scale),
                  curve: Curves.ease,
                  child: BannerItem(
                    appBanner: banner,
                  ),
                  builder: (context, value, child) {
                    return Transform.scale(
                      scale: value,
                      child: child,
                    );
                  },
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                appBannerList.length,
                (index) =>
                    Indicator(isActive: _selectedIndex == index ? true : false),
              )
            ],
          ),
        ],
      ),
    );
  }
}
