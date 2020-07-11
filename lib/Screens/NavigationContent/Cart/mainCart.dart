import 'dart:io';

import 'package:fluffyclientside/utlis/Exports.dart';

class MainCartPage extends StatefulWidget {
  @override
  MainCartPageState createState() => MainCartPageState();
}

class MainCartPageState extends State<MainCartPage>
    with SingleTickerProviderStateMixin {
  final _pageController = PageController();

  final _currentPageNotifier = ValueNotifier<int>(0);
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.easeOut;
  var titles,
      values,
      subTitles,
      pageIndex,
      subTitlePosition,
      btnTitle,
      cartView;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: new PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: cartAppBar(context, () {
            if (_currentPageNotifier.value != 3) {
              Navigator.of(context).pop();
            } else {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => BasicScaffold()),
                  ModalRoute.withName('/'));
            }
          },
              title: titles,
              value: values,
              subTitle: subTitles,
              subTitlePosition: subTitlePosition),
        ),
        body: SafeArea(
          child: _buildBody(),
          bottom: true,
          right: true,
          left: true,
          top: true,
        ),
      ),
    );
  }

  @override
  void initState() {
    if (_currentPageNotifier.value == 0) {
      setState(() {
        titles = 'Edit your Cart';
        values = 0.25;
        subTitles = 'Here we go';
        subTitlePosition = 50.0;
        btnTitle = 'Delivery information';
      });
    }
    super.initState();
  }

  _buildBody() {
    return Container(
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          _buildPageView(),
          SafeArea(
              bottom: true,
              right: true,
              left: true,
              top: true,
              minimum: const EdgeInsets.only(left: 30.0, right: 16.0),
              child: Consumer<Cart>(builder: (context, cart, child) {
                return cart.basketItems.length != 0
                    ? Container(
                        width: MediaQuery.of(context).size.width - 50,
                        child: _currentPageNotifier.value != 3 ? RaisedButton(
                          onPressed: () {
                            if (_currentPageNotifier.value <= 2) {
                              cartView = cart;
                              onPageViewChangeButton();
                            }
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: FluffyColors.BrandColor)),
                          color: FluffyColors.BrandColor,
                          child: Text(
                            btnTitle,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ) : Container(),
                      )
                    : Container();
              }))
        ],
      ),
    );
  }

  _buildPageView() {
    return Container(
      height: MediaQuery.of(context).size.height - 80,
      child: PageView(
          physics: new NeverScrollableScrollPhysics(),
          children: <Widget>[
            EditCartPage(),
            AddressDetailsPage(),
            PaymentPage(),
            ThankYouPage(),
          ],
          scrollDirection: Axis.horizontal,
          controller: _pageController,
          onPageChanged: onPageViewChange),
    );
  }

  onPageViewChange(int page) {
    _currentPageNotifier.value = page;
    if (_currentPageNotifier.value == 0) {
      setState(() {
        titles = 'Edit your Cart';
        values = 0.25;
        subTitles = 'Here we go';
        subTitlePosition = 50.0;
        btnTitle = 'Next step: Delivery information';
      });
    } else if (_currentPageNotifier.value == 1) {
      setState(() {
        titles = 'Address details';
        values = 0.50;
        subTitles = 'Almost Done';
        subTitlePosition = 120.0;
        btnTitle = 'Next step: Payment';
      });
    } else if (_currentPageNotifier.value == 2) {
      setState(() {
        titles = 'Payment';
        values = 0.75;
        subTitles = 'Final Step';
        subTitlePosition = 250.0;
        btnTitle = 'Deliver';
      });
    }
  }

  Future<void> onPageViewChangeButton() async {
    if (_currentPageNotifier.value == 0) {
      pageIndex = ++_currentPageNotifier.value;
      _pageController.nextPage(duration: _kDuration, curve: _kCurve);
    } else if (_currentPageNotifier.value == 1) {
      pageIndex = ++_currentPageNotifier.value;
      _pageController.nextPage(duration: _kDuration, curve: _kCurve);
    } else if (_currentPageNotifier.value == 2) {
      try {
        final result = await InternetAddress.lookup('google.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          if(currentUser != null ){
            Connections.db.collection('Orders').add({
              'address': address,
              'uid': currentUser.uid,
              'uPhone': phoneNum,
              'normal_status':
              scheduledDateTime == '' && showRepeatedOrder == false
                  ? true
                  : null,
              'scheduled_status': scheduledDateTime != '' ? true : null,
              'scheduled_Date_Time':
              scheduledDateTime != '' ? scheduledDateTime : null,
              'repeated_status': showRepeatedOrder == true ? true : null,
              'repeated_days': showRepeatedOrder == true ? daysText : null,
              'products': cartView.basketItems.map((e) {
                Map<String, dynamic> a = {
                  'id': e.id,
                  'name': e.title,
                  'img': e.image,
                  'qty': e.count,
                  'price': e.price
                };
                return a;
              }).toList(),
              'subtotal_price': cartView.totalPrice,
              'delivery_fees': EditCartPageState.deliveryFees,
              'total_price': EditCartPageState.totalP,
              'promo_code': disFinder,
              'final_price': fPrice != null ? fPrice : EditCartPageState.totalP,
              'payment_way': 'Cash',
              'order_status': 'Pedding',
            });
            setState(() {
              titles = 'Thank you !';
              values = 1.0;
              subTitles = 'All done !';
              subTitlePosition = 300.0;
              cartView.clearItems();
              cartView.zeroItems();
            });
            pageIndex = ++_currentPageNotifier.value;
            _pageController.nextPage(duration: _kDuration, curve: _kCurve);
          }

        }
      } on SocketException catch (_) {
        Fluttertoast.showToast(
            msg:
                "You have not internet to create order, try with internet connection",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            textColor: Colors.white,
            backgroundColor: Colors.red,
            timeInSecForIosWeb: 1);
        Navigator.of(context).pop();
      }
    }
  }
}
