import 'package:fluffyclientside/utlis/Exports.dart';

Widget packageItem(txt, img) {
  return Column(
    children: <Widget>[
      ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Image.network(
          img,
          width: 70,
          height: 50,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(3.0),
        child: Text(txt,textAlign: TextAlign.left,style: TextStyle(fontSize: 15,color: Colors.black),),
      ),
    ],
  );
}

Widget catPackage() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Expanded(
        child: Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Special packages',
              style: TextStyle(color: FluffyColors.BrandColor, fontSize: 15),
              textAlign: TextAlign.left,
            ),
            Text(
              'See all',
              style: TextStyle(color: Colors.black, fontSize: 10),
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ),
      Expanded(

        child: ListView.builder(
          itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder:(context, index) {
             return packageItem("Ramadan's free Gifts $index",
                  'https://www.proactiveinvestors.com/thumbs/upload/News/Image/2019_09/1200z740_1568815448_2019-09-18-10-04-08_063521780331bdf62825b7cc9d6332f8.jpg');
            },),
      ),
    ],
  );
}
