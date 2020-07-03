import 'package:fluffyclientside/utlis/Exports.dart';

class BasicScaffold extends StatefulWidget {
  @override
  _BasicScaffoldState createState() => _BasicScaffoldState();
}

class _BasicScaffoldState extends State<BasicScaffold> {
  int _selectedIndex = 0;

  //static List pages = [HomePage(), MyOrderTabs(), MainProfilePage()];
  static List pages = [HomePage(), MyOrderTabs(), Container(child:Center(child: Text('not Finished Yet....')))];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: new Image.asset(
              'assets/HomeIcon.png',
              width: 15,
              height: 15,
              color: _selectedIndex == 0 ? FluffyColors.BrandColor : null,
            ),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Image.asset(
              'assets/OrderIcon.png',
              width: 15,
              height: 15,
              color: _selectedIndex == 1 ? FluffyColors.BrandColor : null,
            ),
            title: Text('Order'),
          ),
          BottomNavigationBarItem(
            icon: new Image.asset(
              'assets/ProfileIcon.png',
              width: 15,
              height: 15,
           //   color: _selectedIndex == 2 ? FluffyColors.BrandColor : null,
              color:  null,
            ),
            title: Text('Profile'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: FluffyColors.BrandColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
