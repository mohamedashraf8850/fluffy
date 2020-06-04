import 'package:fluffyclientside/utlis/Exports.dart';

Widget productItem({img, title, count, price}) {
  return SizedBox(
    height: 400,
    child: Card(
      elevation: 0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Image.network(
                img,
                height: 100,
                width: 100,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                color: FluffyColors.TextColor,
                fontSize: 10,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.start,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '$count Pcs',
                  textAlign: TextAlign.start,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                ),
                RichText(
                  text: TextSpan(
                      text: price,
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
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
            Center(
              child: Container(
                height: 70,
                width: 100,
                child: RaisedButton(
                  onPressed: () {},
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
  return Container(
    color: FluffyColors.BGColor,
    child: GridView.builder(
      itemCount: 5,
      scrollDirection: Axis.vertical,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return productItem(
            title: 'Gourmet Bread Rol with \nBlack Olives',
            img:
                'https://www.proactiveinvestors.com/thumbs/upload/News/Image/2019_09/1200z740_1568815448_2019-09-18-10-04-08_063521780331bdf62825b7cc9d6332f8.jpg',
            count: '3',
            price: '2.00');
      },
    ),
  );
}
