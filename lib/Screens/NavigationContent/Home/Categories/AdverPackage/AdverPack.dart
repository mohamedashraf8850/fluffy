import 'package:fluffyclientside/utlis/Exports.dart';

Widget adverPackageItem_Cate(txt, img, BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    textDirection: TextDirection.ltr,
    textBaseline: TextBaseline.alphabetic,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: ClipRRect(
          borderRadius: new BorderRadius.circular(10.0),
          child: GestureDetector(
              child: Stack(children: <Widget>[
            Image.network(
              img,
              fit: BoxFit.fitWidth,
              width: MediaQuery.of(context).size.width - 100,
              height: 150,
            ),
            Container(
              alignment: Alignment.bottomLeft,
              width: MediaQuery.of(context).size.width - 100,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      txt,
                      style: TextStyle(fontSize: 10, color: Colors.white),
                      textAlign: TextAlign.start,
                    ),
                    RichText(
                      textAlign: TextAlign.end,
                      text: TextSpan(
                          text: 'Get it',
                          style: TextStyle(fontSize: 10, color: Colors.white),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Now!',
                              style: TextStyle(
                                fontSize: 12,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 7,
                    //offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
            ),
          ])),
        ),
      ),
    ],
  );
}

Widget adverCatPackage_Cate() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return adverPackageItem_Cate(
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
