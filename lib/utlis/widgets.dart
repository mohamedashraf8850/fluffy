import 'package:fluffyclientside/utlis/Exports.dart';
import 'package:flutter/cupertino.dart';

class FluffyColors {
  static const BrandColor = Color(0xFF006661);
  static const VerticalColor = Color(0xFFFDD7AB);
  static const TextColor = Color(0xFF3E3E3E);
  static const LocationColor = Color(0xFF7F7F7F);
  static const NotSelectedColor = Color(0xFF9E9E9E);
  static const LabelColor = Color(0xFF707070);
  static const BGColor = Color(0xFFF7FAFD);
}

Widget fluffyCart() {
  return Badge(
    badgeContent: Text('0'),
    child: Image.asset(
      'assets/cartIcon.png',
      width: 25,
      height: 25,
      fit: BoxFit.fill,
    ),
    animationType: BadgeAnimationType.slide,
  );
}

Widget orderItem(bool cart, {img, title, qty, itemPrice, _itemCount}) {
  return Row(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Image.network(
          img,
          width: 80,
          fit: BoxFit.fitWidth,
          height: 80,
        ),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(fontSize: 17, color: Colors.black),
            ),
            cart == true
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            _itemCount != 0
                                ? new IconButton(
                                    icon: new Icon(Icons.remove),
                                    onPressed: () {
                                      _itemCount--;
                                    },
                                  )
                                : new Container(),
                            new Text(_itemCount.toString(),
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                            new IconButton(
                              icon: new Icon(Icons.add),
                              onPressed: () {
                                _itemCount++;
                              },
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Text(
                              itemPrice,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: FluffyColors.BrandColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 2.0),
                              child: Text(
                                'EGP',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: FluffyColors.BrandColor,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            Text(
                              'Qty',
                              style: TextStyle(
                                  fontSize: 15, color: FluffyColors.LabelColor),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              qty,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Text(
                              itemPrice,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: FluffyColors.BrandColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 2.0),
                              child: Text(
                                'EGP',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: FluffyColors.BrandColor,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
          ],
        ),
      )
    ],
  );
}
