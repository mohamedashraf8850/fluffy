import 'package:fluffyclientside/utlis/Exports.dart';
final List<Item> items = [
  Item(title: 'Gourmet Bread Rol with Black Olives ', price: 2.00 , count: 1,id: '1' ),
  Item(title: 'Gourmet Bread Rol with White Olives ', price: 3.00,count: 1,id: '2'),
  Item(title: 'Gourmet Bread Rol with Red Olives ', price: 4.00,count: 1,id: '3'),
  Item(title: 'Gourmet Bread Rol with yellow Olives ', price: 5.00,count: 1,id: '4'),
  Item(title: 'Gourmet Bread Rol with orange Olives ', price: 6.00,count: 1,id: '5'),

];
Widget productItem({img, title, count, price, addToCart}) {
  return Card(
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.0),
    ),
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Center(
                child: Image.network(
                  img,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Text(
                title,
                style: TextStyle(
                  color: FluffyColors.TextColor,
                  fontSize: 10,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '$count Pcs',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  RichText(
                    text: TextSpan(
                        text: price,
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'EGP',
                            style: TextStyle(
                              fontSize: 8,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
            ),
            Center(
              child: Container(
                height: 30,
                width: 80,
                child: RaisedButton(
                  onPressed: addToCart,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: FluffyColors.BrandColor)),
                  color: FluffyColors.BrandColor,
                  child: Text(
                    'ADD TO CART',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

Widget productList() {
  return Consumer<Cart>(builder: (context, cart, child){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        color: FluffyColors.BGColor,
        child: GridView.builder(
          itemCount: items.length,
          scrollDirection: Axis.vertical,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return productItem(
                title: items[index].title,
                img:
                    'https://www.proactiveinvestors.com/thumbs/upload/News/Image/2019_09/1200z740_1568815448_2019-09-18-10-04-08_063521780331bdf62825b7cc9d6332f8.jpg',
                count: '3',
                price: items[index].price.toString(),
            addToCart: () {
              cart.add(items[index]);
            }
            );
          },
        ),
      ),
    );
});
}
