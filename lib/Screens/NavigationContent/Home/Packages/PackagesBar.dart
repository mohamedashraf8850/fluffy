import 'package:fluffyclientside/utlis/Exports.dart';

Widget packageItem(txt, img, BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    textDirection: TextDirection.ltr,
    textBaseline: TextBaseline.alphabetic,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 25.0),
        child: ClipRRect(
          borderRadius: new BorderRadius.circular(10.0),
          child: Image.network(
            img,
            fit: BoxFit.fitWidth,
            width: MediaQuery.of(context).size.width - 150,
            height: 120,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top:5.0,left: 8.0),
        child: Text(
          txt,
          style: TextStyle(fontSize: 13, color: Colors.black),
          textAlign: TextAlign.start,
        ),
      ),
    ],
  );
}

Widget catPackage() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 30.0,left: 8.0,right: 8.0,bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Special packages',
              style: TextStyle(color: FluffyColors.BrandColor, fontSize: 17,fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,

            ),
            Text(
              'See all',
              style: TextStyle(color: Colors.black, fontSize: 15),
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ),
      Expanded(
        flex: 1,
        child: Padding(
          padding: const EdgeInsets.only(right:8,left:8,),
          child: ListView.builder(
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return packageItem(
                  "Ramadan's FREE gifts",
                  'https://www.proactiveinvestors.com/thumbs/upload/News/Image/2019_09/1200z740_1568815448_2019-09-18-10-04-08_063521780331bdf62825b7cc9d6332f8.jpg',
                  context);
            },
          ),
        ),
      ),
    ],
  );
}
