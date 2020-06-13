import 'package:fluffyclientside/utlis/Exports.dart';

class MainCartPage extends StatefulWidget {
  @override
  _MainCartPageState createState() => _MainCartPageState();
}

class _MainCartPageState extends State<MainCartPage> {
  final _pageController = PageController();
  final _currentPageNotifier = ValueNotifier<int>(0);
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.easeOut;
  var titles, values, subTitles, pageIndex, subTitlePosition;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: cartAppBar(context,
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
              child: Container(
                width: MediaQuery.of(context).size.width - 50,
                child: RaisedButton(
                  onPressed: () {
                    print(_currentPageNotifier.value);
                    if (_currentPageNotifier.value <= 1) {
                      if (_currentPageNotifier.value == 0) {
                        setState(() {
                          titles = 'Edit your Cart';
                          values = 0.25;
                          subTitles = 'Here we go';
                          subTitlePosition = 50.0;
                        });
                      } else if (_currentPageNotifier.value == 1) {
                        setState(() {
                          titles = 'Cart 2';
                          values = 0.50;
                          subTitles = 'Here we go2';
                          subTitlePosition = 120.0;
                        });
                      } else if (_currentPageNotifier.value == 2) {
                        setState(() {
                          titles = 'Cart 3';
                          values = 1.0;
                          subTitles = 'Here we go3';
                          subTitlePosition = 250.0;
                        });
                      }
                      pageIndex = ++_currentPageNotifier.value;
                      _pageController.nextPage(
                          duration: _kDuration, curve: _kCurve);
                    }
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: FluffyColors.BrandColor)),
                  color: FluffyColors.BrandColor,
                  child: Text(
                    'Next step: Delivery information',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ))
        ],
      ),
    );
  }

  _buildPageView() {
    return Container(
      height: MediaQuery.of(context).size.height - 80,
      child: PageView(
          children: <Widget>[
            EditCartPage(),
            EditCartPage(),
            EditCartPage(),
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
      });
    } else if (_currentPageNotifier.value == 1) {
      setState(() {
        titles = 'Cart 2';
        values = 0.50;
        subTitles = 'Here we go2';
        subTitlePosition = 120.0;
      });
    } else if (_currentPageNotifier.value == 2) {
      setState(() {
        titles = 'Cart 3';
        values = 1.0;
        subTitles = 'Here we go3';
        subTitlePosition = 250.0;
      });
    }
  }
}
