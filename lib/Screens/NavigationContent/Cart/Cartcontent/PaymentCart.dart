import 'package:fluffyclientside/utlis/Exports.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage>
    with TickerProviderStateMixin {
  String choice,
      daysText,
      _radioValue,
      sunText,
      monText,
      tueText,
      wedText,
      thuText,
      friText,
      satText,
      allWeekText,
      disFinder,
      paymentWay;

  num promoDiscount, fPrice;

  bool swValue = false,
      showRepeatedOrder = false,
      sun = false,
      mon = false,
      tue = false,
      wed = false,
      thu = false,
      fri = false,
      sat = false,
      allWeek = true;

  final promoCodeKey = GlobalKey<FormState>();

  TextEditingController promoCodeController = new TextEditingController();
  TextEditingController cardNumController = new TextEditingController();
  TextEditingController cardDateController = new TextEditingController();

  void _onChangedRadio(bool value) => setState(() {
        swValue = value;
        if (swValue == true) {
          showRepeatedOrder = true;
        } else {
          showRepeatedOrder = false;
        }
      });

  @override
  void initState() {
    setState(() {
      _radioValue = "Cash on delivery";
      allWeekText = allWeek == true ? 'All Week' : '';
      daysText = '$allWeekText';
    });
    print(daysText);
    super.initState();
  }

  void radioButtonChanges(String value) {
    setState(() {
      _radioValue = value;
      switch (value) {
        case 'Cash on delivery':
          choice = value;
          paymentWay = 'Cash on delivery';
          break;
        case 'Credit card':
          choice = value;
          paymentWay = 'Credit card';
          showDialog<String>(
              context: context,
              barrierDismissible:
                  false, // dialog is dismissible with a tap on the barrier
              builder: (BuildContext context) {
                return Consumer<Cart>(builder: (context, cart, child) {
                  return StatefulBuilder(
                    builder: (context, setState) {
                      return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          backgroundColor: Colors.transparent,
                          insetPadding: EdgeInsets.all(10),
                          child: Container(
                            height: MediaQuery.of(context).size.height - 400,
                            child: AlertDialog(
                              title: Text('Enter your Card Data'),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              backgroundColor: Colors.white,
                              insetPadding: EdgeInsets.all(10),
                              content: Column(
                                children: <Widget>[
                                  new Row(
                                    children: <Widget>[
                                      new Expanded(
                                          child: new TextField(
                                        autofocus: true,
                                        inputFormatters: [
                                          MaskedTextInputFormatter(
                                            mask: 'xxxx-xxxx-xxxx-xxxx',
                                            separator: '-',
                                          ),
                                        ],
                                        decoration: new InputDecoration(
                                          labelText: 'Card Number',
                                          fillColor: FluffyColors.BrandColor,
                                          focusColor: FluffyColors.BrandColor,
                                          hintText: 'ex. 4242259234928432',
                                          suffix: Icon(
                                            Icons.credit_card,
                                            color: FluffyColors.BrandColor,
                                          ),
                                        ),
                                        keyboardType: TextInputType.number,
                                        controller: cardNumController,
                                      ))
                                    ],
                                  ),
                                  new Row(
                                    children: <Widget>[
                                      new Expanded(
                                          child: new TextField(
                                        autofocus: true,
                                        keyboardType: TextInputType.datetime,
                                        inputFormatters: [
                                          MaskedTextInputFormatter(
                                            mask: 'MM/YYYY',
                                            separator: '/',
                                          ),
                                        ],
                                        decoration: new InputDecoration(
                                            suffix: Icon(
                                              Icons.date_range,
                                              color: FluffyColors.BrandColor,
                                            ),
                                            labelText:
                                                'Expiry Month and Expiry Year',
                                            hintText: 'ex. 12/2020'),
                                        controller: cardDateController,
                                      ))
                                    ],
                                  ),
                                ],
                              ),
                              actions: <Widget>[
                                RaisedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(
                                          color: FluffyColors.BrandColor)),
                                  color: FluffyColors.BrandColor,
                                  child: Text(
                                    'Cancel',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ),
                                RaisedButton(
                                  onPressed: () {
                                    PaymentCard card = new PaymentCard(
                                        number: cardNumController.text
                                            .replaceAll('-', ''),
                                        expiry_month: cardDateController.text
                                            .split('/')[0],
                                        expiry_year: cardDateController.text
                                            .split('/')[1]);
                                    CheckOut payment = CheckOut();
                                    int amount =
                                        (cart.totalPrice * 100).toInt();
                                    payment
                                        .makePayment(card, amount)
                                        .then((value) async {
                                      if (value == true) {
                                        try{
                                          Connections.db.collection('Orders').add({
                                            'address': '123',
                                            'uid': '123456',
                                            'uPhone': '01fsd2f3sd',
                                            'normal_status': true,
                                            'products': cart.basketItems.map((e) {
                                              Map<String, dynamic> a = {
                                                'id': e.id,
                                                'name': e.title,
                                                'img': e.image,
                                                'qty': e.count,
                                                'price': e.price
                                              };
                                              return a;
                                            }).toList(),
                                            'subtotal_price': 12,
                                            'delivery_fees': 12,
                                            'total_price': 12,
                                            'promo_code': 'sadlskaf',
                                            'final_price': 12,
                                            'payment_way': 'eny',
                                            'order_status': 'Pedding',
                                          });
                                          Fluttertoast.showToast(
                                              msg: "Congratulations, your Order are Created Successfully ,now track it in Orders Page",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.TOP,
                                              textColor: Colors.white,
                                              backgroundColor: FluffyColors.BrandColor,
                                              timeInSecForIosWeb: 1);

                                        }catch(e){
                                          Fluttertoast.showToast(
                                              msg: "Error while Create your Order, please try later",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.TOP,
                                              textColor: Colors.white,
                                              backgroundColor: Colors.red,
                                              timeInSecForIosWeb: 1);
                                        }

                                      } else {
                                        return print('Error');
                                      }
                                    });
                                    Navigator.of(context).pop();
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(
                                          color: FluffyColors.BrandColor)),
                                  color: FluffyColors.BrandColor,
                                  child: Text(
                                    'Deliver',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                          ));
                    },
                  );
                });
              });
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
                  child: StreamBuilder<QuerySnapshot>(
                      stream:
                          Connections.db.collection('PromoCodes').snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Consumer<Cart>(
                              builder: (context, cart, child) {
                            return Form(
                              key: promoCodeKey,
                              child: fluffyTextField(
                                context,
                                validate: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter some text';
                                  } else if (value == ' ') {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
                                onSaved: (String value) {
                                  if (promoCodeKey.currentState.validate()) {
                                    disFinder = snapshot.data.documents
                                        .where((l) => l.data['code'] == value)
                                        .map((doc) => doc.data['discount'])
                                        .toString()
                                        .replaceAll(')', '')
                                        .toString()
                                        .replaceAll('(', '');
                                    if (disFinder == '()' || disFinder == '') {
                                      Fluttertoast.showToast(
                                          msg: "This Code are not founded",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.TOP,
                                          textColor: Colors.white,
                                          backgroundColor: Colors.red,
                                          timeInSecForIosWeb: 1);
                                    } else {
                                      print(value);
                                      setState(() {
                                        promoDiscount = int.parse(disFinder);
                                      });
                                      num discountPrecentage =
                                          promoDiscount / 100;
                                      num disPrice =
                                          cart.totalPrice * discountPrecentage;
                                      fPrice = cart.totalPrice - disPrice;
                                      print(fPrice);
                                      Fluttertoast.showToast(
                                          msg:
                                              "Congratulations, you have got a discount $disFinder% for your Cart",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.TOP,
                                          textColor: Colors.white,
                                          backgroundColor:
                                              FluffyColors.BrandColor,
                                          timeInSecForIosWeb: 1);
                                    }
                                  }
                                },
                                controller: promoCodeController,
                                hintText: 'Your Promo Code',
                                size: 60,
                              ),
                            );
                          });
                        } else {
                          return Container(
                              child: Center(
                                  child: Text(
                                      'we are Sorry for that , but No Promo Codes are Available now.')));
                        }
                      }),
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
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: showRepeatedOrder == true
                          ? 'Your Order will Repeated on '
                          : '',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: showRepeatedOrder == true ? daysText : '',
                          style: TextStyle(
                              fontSize: 25,
                              color: FluffyColors.BrandColor,
                              fontWeight: FontWeight.bold),
                        )
                      ]),
                ))
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
                      allWeek = false;
                      if (daysText.contains('Sun') == true) {
                        print(daysText.contains(' Sun'));
                        setState(() {
                          daysText = daysText.replaceAll(' Sun', '');
                        });
                      } else {
                        setState(() {
                          allWeekMethod();
                          daysText = daysText + ' Sun';
                        });
                      }
                    });
                  },
                ),
                GestureDetector(
                  child: cardItem(title: 'Mon', boolType: mon),
                  onTap: () {
                    setState(() {
                      mon = !mon;
                      allWeek = false;

                      if (daysText.contains('Mon') == true) {
                        print(daysText.contains(' Mon'));
                        setState(() {
                          daysText = daysText.replaceAll(' Mon', '');
                        });
                      } else {
                        setState(() {
                          allWeekMethod();
                          daysText = daysText + ' Mon';
                        });
                      }
                    });
                  },
                ),
                GestureDetector(
                  child: cardItem(title: 'Tue', boolType: tue),
                  onTap: () {
                    setState(() {
                      tue = !tue;
                      allWeek = false;

                      if (daysText.contains('Tue') == true) {
                        print(daysText.contains(' Tue'));
                        setState(() {
                          daysText = daysText.replaceAll(' Tue', '');
                        });
                      } else {
                        setState(() {
                          allWeekMethod();
                          daysText = daysText + ' Tue';
                        });
                      }
                    });
                  },
                ),
                GestureDetector(
                  child: cardItem(title: 'Wed', boolType: wed),
                  onTap: () {
                    setState(() {
                      wed = !wed;
                      allWeek = false;

                      if (daysText.contains('Wed') == true) {
                        print(daysText.contains(' Wed'));
                        setState(() {
                          daysText = daysText.replaceAll(' Wed', '');
                        });
                      } else {
                        setState(() {
                          allWeekMethod();
                          daysText = daysText + ' Wed';
                        });
                      }
                    });
                  },
                ),
                GestureDetector(
                  child: cardItem(title: 'Thu', boolType: thu),
                  onTap: () {
                    setState(() {
                      thu = !thu;
                      allWeek = false;

                      if (daysText.contains('Thu') == true) {
                        print(daysText.contains(' Sun'));
                        setState(() {
                          daysText = daysText.replaceAll(' Thu', '');
                        });
                      } else {
                        setState(() {
                          allWeekMethod();
                          daysText = daysText + ' Thu';
                        });
                      }
                    });
                  },
                ),
                GestureDetector(
                  child: cardItem(title: 'Fri', boolType: fri),
                  onTap: () {
                    setState(() {
                      fri = !fri;
                      allWeek = false;

                      if (daysText.contains('Fri') == true) {
                        print(daysText.contains(' Fri'));
                        setState(() {
                          daysText = daysText.replaceAll(' Fri', '');
                        });
                      } else {
                        setState(() {
                          allWeekMethod();
                          daysText = daysText + ' Fri';
                        });
                      }
                    });
                  },
                ),
                GestureDetector(
                  child: cardItem(title: 'Sat', boolType: sat),
                  onTap: () {
                    setState(() {
                      sat = !sat;
                      allWeek = false;

                      if (daysText.contains('Sat') == true) {
                        print(daysText.contains(' Sat'));
                        setState(() {
                          daysText = daysText.replaceAll(' Sat', '');
                        });
                      } else {
                        setState(() {
                          allWeekMethod();
                          daysText = daysText + ' Sat';
                        });
                      }
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
                      sun = false;
                      mon = false;
                      tue = false;
                      wed = false;
                      thu = false;
                      fri = false;
                      sat = false;
                      daysText = 'All Week';
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

  void allWeekMethod() {
    if (daysText.contains('All Week') == true) {
      setState(() {
        daysText = daysText.replaceAll('All Week', '');
      });
    }
  }

  Future<void> createRepeatedOrder() {
    Consumer<Cart>(builder: (context, cart, child) {
      var a = Connections.db.collection('Orders').add({
        'address': '',
        'uid': '',
        'uPhone': '',
        'repeated_status': true,
        'repeated_days': daysText,
        'products': cart.basketItems,
        'subtotal_price': '',
        'delivery_fees': '',
        'total_price': '',
        'promo_code': '',
        'final_price': '',
        'payment_way': '',
      });
      return null;
    });
  }

  Future<void> createShceduledOrder() {
    Consumer<Cart>(builder: (context, cart, child) {
      var a = Connections.db.collection('Orders').add({
        'address': '',
        'uid': '',
        'uPhone': '',
        'scheduled_status': true,
        'scheduled_Date_Time': '',
        'products': cart.basketItems,
        'subtotal_price': '',
        'delivery_fees': '',
        'total_price': '',
        'promo_code': '',
        'final_price': '',
        'payment_way': '',
      });
      return null;
    });
  }
}
