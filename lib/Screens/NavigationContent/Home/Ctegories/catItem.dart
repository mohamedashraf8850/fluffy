import 'package:fluffyclientside/utlis/Exports.dart';


Widget catItem(txt, img) {
  return Column(
    children: <Widget>[
      ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Image.network(
          img,
          width: 50,
          height: 50,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(3.0),
        child: Text(txt,textAlign: TextAlign.center,style: TextStyle(fontSize: 15,color: Colors.black),),
      ),
    ],
  );
}

Widget catList() {
  return Expanded (
    child: ListView.builder(
      itemCount: 5,
      scrollDirection: Axis.horizontal,
      itemBuilder:(context, index) {
        return catItem("Bread&Bakery $index",
            'https://www.proactiveinvestors.com/thumbs/upload/News/Image/2019_09/1200z740_1568815448_2019-09-18-10-04-08_063521780331bdf62825b7cc9d6332f8.jpg');
      },),
  );
}
