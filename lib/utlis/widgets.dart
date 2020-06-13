import 'package:fluffyclientside/utlis/Exports.dart';

class FluffyColors {
  static const BrandColor = Color(0xFF006661);
  static const VerticalColor = Color(0xFFFDD7AB);
  static const TextColor = Color(0xFF3E3E3E);
  static const LocationColor = Color(0xFF7F7F7F);
  static const NotSelectedColor = Color(0xFF9E9E9E);
  static const LabelColor = Color(0xFF707070);
  static const BGColor = Color(0xFFF7FAFD);
}

Widget fluffyCart(BuildContext context) {
  return Consumer<Cart>(builder: (context, cart, child) {
    return GestureDetector(
      child: Badge(
        badgeContent: Text(cart.count.toString()),
        child: Image.asset(
          'assets/cartIcon.png',
          width: 25,
          height: 25,
          fit: BoxFit.fill,
        ),
        animationType: BadgeAnimationType.slide,
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => MainCartPage()),
        );
      },
    );
  });
}

Widget orderItem(bool listCart, BuildContext context,
    {img, title, qty, itemPrice, itemCount, index}) {
  return Consumer<Cart>(builder: (context, cart, child) {
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
                style: TextStyle(
                    fontSize: 17,
                    color: listCart == false
                        ? Colors.black
                        : FluffyColors.BrandColor),
              ),
              listCart == true
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              itemCount != "1"
                                  ? SizedBox(
                                      width: 25,
                                      height: 25,
                                      child: CircleAvatar(
                                        backgroundColor:
                                            FluffyColors.BrandColor,
                                        radius: 20,
                                        child: new IconButton(
                                          icon: new Icon(
                                            Icons.remove,
                                            color: Colors.white,
                                            size: 10,
                                          ),
                                          onPressed: () {
                                            cart.removeItem(
                                                cart.basketItems[index]);
                                          },
                                        ),
                                      ),
                                    )
                                  : new Container(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: new Text(itemCount.toString(),
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                              ),
                              SizedBox(
                                width: 25,
                                height: 25,
                                child: CircleAvatar(
                                  backgroundColor: FluffyColors.BrandColor,
                                  radius: 20,
                                  child: new IconButton(
                                    icon: new Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 10,
                                    ),
                                    onPressed: () {
                                      cart.add(cart.basketItems[index]);
                                    },
                                  ),
                                ),
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
                                    color: listCart == true
                                        ? Colors.black
                                        : FluffyColors.BrandColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 2.0),
                                child: Text(
                                  'EGP',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: listCart == true
                                          ? Colors.black
                                          : FluffyColors.BrandColor,
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
                                    fontSize: 15,
                                    color: FluffyColors.LabelColor),
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
  });
}

Widget fluffyTextField(BuildContext context,
    {String hintText, controller, bool suffix}) {
  return Container(
    width: MediaQuery.of(context).size.width - 30,
    child: Theme(
      data: new ThemeData(
        primaryColor: FluffyColors.BrandColor,
        primaryColorDark: FluffyColors.BrandColor,
      ),
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: 15),
        decoration: new InputDecoration(
          border: new OutlineInputBorder(
              borderRadius: BorderRadius.circular(35),
              borderSide: new BorderSide(
                  color: FluffyColors.LocationColor.withOpacity(0.3))),
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 15),
          fillColor: FluffyColors.BrandColor,
          hoverColor: FluffyColors.BrandColor,
          focusColor: FluffyColors.BrandColor,
          suffixText: suffix == true ? '+20' : null,
          contentPadding: const EdgeInsets.only(left: 15.0),
        ),
      ),
    ),
  );
}
