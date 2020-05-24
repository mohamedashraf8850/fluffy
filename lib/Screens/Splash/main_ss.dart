import 'package:fluffyclientside/utlis/Exports.dart';


class MainSplashScreen extends StatefulWidget {
  @override
  _MainSplashScreenState createState() => _MainSplashScreenState();
}

class _MainSplashScreenState extends State<MainSplashScreen> {
  final _pageController = PageController();
  final _currentPageNotifier = ValueNotifier<int>(0);
  int pageIndex;
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.easeOut;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new PreferredSize(
        preferredSize: Size.fromHeight(0.0),
        child: AppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      child: Text(
                        'Skip',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: FluffyColors.TextColor,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: (){
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => FourthLocationSplashScreen()), (Route<dynamic> route) => false);
                      },
                    ),
                    Padding(
                      child: _buildCircleIndicator(),
                      padding: const EdgeInsets.only(left: 30.0),
                    ),
                    RaisedButton(
                      onPressed: () {
                        print(_currentPageNotifier.value);
                        if (_currentPageNotifier.value <= 1) {
                          pageIndex = ++_currentPageNotifier.value;
                          _pageController.nextPage(
                              duration: _kDuration, curve: _kCurve);
                        }else {
                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => FourthLocationSplashScreen()), (Route<dynamic> route) => false);
                        }
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: FluffyColors.BrandColor)),
                      color: FluffyColors.BrandColor,
                      child: Text(
                        'Next',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    )
                  ],
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
            FirstSplashScreen(),
            SecondSplashScreen(),
            ThirdSplashScreen(),
          ],
          scrollDirection: Axis.horizontal,
          controller: _pageController,
          onPageChanged: onPageViewChange),
    );
  }

  onPageViewChange(int page) {
    _currentPageNotifier.value = page;
  }

  _buildCircleIndicator() {
    return CirclePageIndicator(
      size: 5,
      selectedSize: 5,
      selectedDotColor: FluffyColors.BrandColor,
      itemCount: 3,
      currentPageNotifier: _currentPageNotifier,
    );
  }
}
