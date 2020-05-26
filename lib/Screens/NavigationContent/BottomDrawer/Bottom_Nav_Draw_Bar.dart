import 'package:fluffyclientside/utlis/Exports.dart';

class BasicScaffold extends StatefulWidget {

  @override
  _BasicScaffoldState createState() => _BasicScaffoldState();
}

class _BasicScaffoldState extends State<BasicScaffold> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: new Image.asset('assets/HomeIcon.png'),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Image.asset('assets/OrderIcon.png'),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: new Image.asset('assets/ProfileIcon.png'),
            title: Text('School'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor:FluffyColors.BrandColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
