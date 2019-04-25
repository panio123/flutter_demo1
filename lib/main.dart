import 'package:flutter/material.dart';

import 'data.dart';
import 'swiper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: App(),
    );
  }
}

class App extends StatelessWidget {
  final List<Widget> _swipetItems = List.from(images.map((img) => Image.asset(
        img,
        fit: BoxFit.cover,
      )));

  Widget _backButton() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: Icon(
          Icons.navigate_before,
          color: Colors.white,
          size: 40.0,
        ),
      ),
    );
  }

  Widget _block(double heigth) {
    return SizedBox(
      height: heigth,
    );
  }

  Widget _star(Color color) {
    return Icon(
      Icons.star,
      color: color,
      size: 15.0,
    );
  }

  Widget _supplying(IconData icon, String label) {
    return Wrap(
      direction: Axis.vertical,
      spacing: 10.0,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          child: Icon(
            icon,
            color: Colors.grey,
          ),
        ),
        Text(
          label,
          style: TextStyle(color: Colors.grey, fontSize: 12.0),
        )
      ],
    );
  }

  Widget _listItem() {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Wrap(
                alignment: WrapAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 5.0,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    backgroundImage: AssetImage('assets/image_01.png'),
                  ),
                  Text(
                    'Booking.com',
                    style: TextStyle(fontSize: 14.0),
                  )
                ],
              ),
              Text(
                '\$450',
                style: TextStyle(color: Colors.orange, fontSize: 15.0),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _content() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(20.0),
          topEnd: Radius.circular(20.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Holiday Hotel Paris East Station',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
            ),
          ),
          _block(20.0),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 5.0,
            children: <Widget>[
              Wrap(
                spacing: 1.0,
                children: <Widget>[
                  _star(Colors.orange),
                  _star(Colors.orange),
                  _star(Colors.orange),
                  _star(Colors.orange),
                  _star(Colors.grey),
                ],
              ),
              Text(
                '8.0',
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
              Text(
                '(6040 reviews)',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          _block(20.0),
          Wrap(
            spacing: 8.0,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: <Widget>[
              Icon(
                Icons.location_on,
                size: 15.0,
                color: Colors.blue,
              ),
              Text(
                '5 rue du 8Mail 1945.',
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
            ],
          ),
          _block(30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _supplying(Icons.directions_car, 'Transfer'),
              _supplying(Icons.local_dining, 'Food'),
              _supplying(Icons.wifi, 'Fitness'),
              _supplying(Icons.shopping_cart, 'Shop'),
              _supplying(Icons.more_horiz, 'More'),
            ],
          ),
          _block(20.0),
          Divider(),
          _block(20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Wrap(
                direction: Axis.vertical,
                spacing: 10.0,
                children: <Widget>[
                  Text('Arrival',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey,
                      )),
                  Text('Mon,04.05.2019', style: TextStyle(fontSize: 16.0))
                ],
              ),
              Wrap(
                direction: Axis.vertical,
                spacing: 10.0,
                children: <Widget>[
                  Text('Departure',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey,
                      )),
                  Text('Sat,16.08.2019', style: TextStyle(fontSize: 16.0))
                ],
              )
            ],
          ),
          _block(20.0),
          Divider(),
          _block(20.0),
          Column(
            children: <Widget>[
              _listItem(),
              _listItem(),
              _listItem(),
              _listItem(),
              _listItem(),
              _listItem(),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Swiper(
              children: _swipetItems,
              itemCount: images.length,
            ),
            Container(
              padding: EdgeInsets.only(top: width - 20.0),
              width: width,
              child: _content(),
            ),
            Positioned(
              top: 10.0,
              left: 10.0,
              child: SafeArea(
                child: _backButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
