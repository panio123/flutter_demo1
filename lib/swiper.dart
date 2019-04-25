import 'package:flutter/material.dart';

class _Swiper extends State<Swiper> {
  double _activeIndex = 1;
  PageController _controller = PageController();

  @override
  void initState() {
    _controller.addListener(() {
      setState(() {
        _activeIndex = _controller.page + 1;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Stack(children: <Widget>[
        PageView(
          controller: _controller,
          children: widget.children,
        ),
        Positioned(
          bottom: 30.0,
          right: 20.0,
          child: DefaultTextStyle(
            style: TextStyle(
              color: Colors.white,
              fontSize: 13.0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: <Widget>[
                Text(
                  _activeIndex.toInt().toString(),
                  style: TextStyle(fontSize: 25.0),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.0),
                  child: Text('/'),
                ),
                Text(widget.itemCount.toString()),
              ],
            ),
          ),
        )
      ]),
    );
  }
}

class Swiper extends StatefulWidget {
  final List<Widget> children;
  final int itemCount;

  Swiper({this.children, this.itemCount, key})
      : assert(children != null),
        assert(itemCount != null),
        super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Swiper();
  }
}
