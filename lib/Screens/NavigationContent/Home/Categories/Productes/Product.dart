import 'package:fluffyclientside/utlis/Exports.dart';

Widget productItem({img, title, count, price}) {
  return Card(
    elevation: 1,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image.network(
          img,
          height: 50,
          width: 50,
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
            RaisedButton(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: FluffyColors.BrandColor)),
              color: FluffyColors.BrandColor,
              child: Text(
                'ADD TO CART',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            )
          ],
        ),
      ],
    ),
  );
}

Widget productList() {
  return Expanded(
    flex: 2,
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
            price: 2.00);
      },
    ),
  );
}
