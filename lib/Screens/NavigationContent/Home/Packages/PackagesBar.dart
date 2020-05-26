import 'package:fluffyclientside/utlis/Exports.dart';

Widget packageItem(txt, img , BuildContext context) {
  return Column(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left:4.0,right: 4.0),
        child: ClipRRect(
          borderRadius: new BorderRadius.circular(8.0),
          child: Image.network(
            img,
            width: MediaQuery.of(context).size.width - 100,
            height: 100,
          ),
        ),
      ),
      Text(txt,textAlign: TextAlign.left,style: TextStyle(fontSize: 12,color: Colors.black),),
    ],
  );
}

Widget catPackage() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Special packages',
              style: TextStyle(color: FluffyColors.BrandColor, fontSize: 20),

              textAlign: TextAlign.left,
            ),
            Text(
              'See all',
              style: TextStyle(color: Colors.black, fontSize: 15),
              textAlign: TextAlign.right,
            ),
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder:(context, index) {
                 return packageItem("Ramadan's free Gifts $index",
                      'https://www.proactiveinvestors.com/thumbs/upload/News/Image/2019_09/1200z740_1568815448_2019-09-18-10-04-08_063521780331bdf62825b7cc9d6332f8.jpg',context);
                },),
          ),
        ),
      ],
    ),
  );
}
