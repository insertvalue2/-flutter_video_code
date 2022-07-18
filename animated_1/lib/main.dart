import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var isOpen = true;

  _toggleOpen() {
    setState(() {
      isOpen = !isOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sample Code Animation'),
        backgroundColor: Colors.orange,
        elevation: 0.0,
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints.tightForFinite(),
        child: Center(
          child: Stack(
            children: <Widget>[
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.fastOutSlowIn,
                width: isOpen ? 240 : 48,
                height: 48,
                decoration: ShapeDecoration(
                  color: Colors.orange[100],
                  shape: StadiumBorder(),
                ),
              ),
              Container(
                width: 40.0,
                margin: const EdgeInsets.only(left: 4.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: AnimatedCrossFade(
                  duration: const Duration(milliseconds: 250),
                  firstChild: IconButton(
                    icon: Icon(CupertinoIcons.arrow_uturn_right),
                    onPressed: () {
                      _toggleOpen();
                    },
                  ),
                  secondChild: IconButton(
                    icon: Icon(CupertinoIcons.clear),
                    onPressed: () {
                      _toggleOpen();
                    },
                  ),
                  crossFadeState: !isOpen
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                ),
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 400),
                opacity: isOpen ? 1 : 0,
                child: Container(
                  padding: const EdgeInsets.only(left: 40.0),
                  width: 240,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: Icon(CupertinoIcons.hand_thumbsup),
                        onPressed: () {},
                      ),
                      Icon(CupertinoIcons.heart),
                      Icon(CupertinoIcons.hand_thumbsdown),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
