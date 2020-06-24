import 'package:fluffyclientside/utlis/Exports.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage>
    with TickerProviderStateMixin {
  String choice, _radioValue;
  bool swValue = false;
  bool sun = false,
      mon = false,
      tue = false,
      wed = false,
      thu = false,
      fri = false,
      sat = false,
      allWeek = true;

  TextEditingController promoCodeController = new TextEditingController();
  void _onChangedRadio(bool value) => setState(() {
        swValue = value;
      });

  @override
  void initState() {
    setState(() {
      _radioValue = "Cash on delivery";
    });
    super.initState();
  }

  void radioButtonChanges(String value) {
    setState(() {
      _radioValue = value;
      switch (value) {
        case 'Cash on delivery':
          choice = value;
          break;
        case 'Credit card':
          choice = value;
          break;
        default:
          choice = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 20.0),
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 15,
            ),
            Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text('Cash on delivery',
                        style: TextStyle(
                            color: FluffyColors.BrandColor, fontSize: 15)),
                  ),
                  Radio(
                    value: 'Cash on delivery',
                    activeColor: FluffyColors.BrandColor,
                    onChanged: radioButtonChanges,
                    groupValue: _radioValue,
                  ),
                ],
              ),
              color: Colors.transparent,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(
                      color: FluffyColors.BrandColor.withOpacity(0.3))),
            ),
            SizedBox(
              height: 15,
            ),
            Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text('Credit card',
                        style: TextStyle(
                            color: FluffyColors.BrandColor, fontSize: 15)),
                  ),
                  Radio(
                    value: 'Credit card',
                    activeColor: FluffyColors.BrandColor,
                    onChanged: radioButtonChanges,
                    groupValue: _radioValue,
                  ),
                ],
              ),
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(
                      color: FluffyColors.BrandColor.withOpacity(0.3))),
            ),
            SizedBox(
              height: 15,
            ),
            ExpansionTile(
              title: Text(
                'add promo code',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              backgroundColor: Colors.white,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: fluffyTextField(
                    context,
                    controller: promoCodeController,
                    hintText: 'Your Promo Code',
                    size: 60,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            SwitchListTile(
              value: swValue,
              activeColor: FluffyColors.BrandColor,
              onChanged: _onChangedRadio,
              title: new Text('Repeat order',
                  style: new TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black)),
            )
          ],
        ),
      ),
      bottomSheet: swValue == true
          ? SolidBottomSheet(
              headerBar: Container(
                height: 50,
                child: Card(
                  color: Colors.white,
                  child: Center(
                      child: Text(
                    "Repeat order every",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  )),
                  elevation: 0,
                  shadowColor: FluffyColors.BrandColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0)),
                  ),
                ),
              ),
              body: GridView.count(crossAxisCount: 3, children: <Widget>[
                GestureDetector(
                  child: cardItem(title: 'Sun', boolType: sun),
                  onTap: () {
                    setState(() {
                      sun = !sun;
                    });
                  },
                ),
                GestureDetector(
                  child: cardItem(title: 'Mon', boolType: mon),
                  onTap: () {
                    setState(() {
                      mon = !mon;
                    });
                  },
                ),
                GestureDetector(
                  child: cardItem(title: 'Tue', boolType: tue),
                  onTap: () {
                    setState(() {
                      tue = !tue;
                    });
                  },
                ),
                GestureDetector(
                  child: cardItem(title: 'Wed', boolType: wed),
                  onTap: () {
                    setState(() {
                      wed = !wed;
                    });
                  },
                ),
                GestureDetector(
                  child: cardItem(title: 'Thu', boolType: thu),
                  onTap: () {
                    setState(() {
                      thu = !thu;
                    });
                  },
                ),
                GestureDetector(
                  child: cardItem(title: 'Fri', boolType: fri),
                  onTap: () {
                    setState(() {
                      fri = !fri;
                    });
                  },
                ),
                GestureDetector(
                  child: cardItem(title: 'Sat', boolType: sat),
                  onTap: () {
                    setState(() {
                      sat = !sat;
                    });
                  },
                ),
                GestureDetector(
                  child: Card(
                    child: Center(
                      child: Text(
                        'All week',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color:
                                allWeek == false ? Colors.black : Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    color: allWeek == true
                        ? FluffyColors.BrandColor
                        : Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      allWeek = !allWeek;
                    });
                  },
                ),
              ]),
              elevation: 8,
            )
          : null,
    );
  }

  Widget cardItem({title, boolType}) {
    return Card(
      child: Center(
        child: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ),
      color: boolType == false ? Colors.white : FluffyColors.CardClick,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
    );
  }
}
