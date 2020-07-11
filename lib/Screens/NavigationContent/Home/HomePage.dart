import 'package:fluffyclientside/utlis/Exports.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = "";
String uAddress = '';
  @override
  void initState() {
    if (currentUser != null) {
      dataofUser();
    }
    super.initState();
  }
  dataofUser() async {
    userData = await getUserData(currentUser.uid);
    setState(() {
      uAddress = userData.userAddress;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: homeAppBar(context,uAddress),
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width - 30,
              child: Theme(
                data: new ThemeData(
                  primaryColor: FluffyColors.BrandColor,
                  primaryColorDark: FluffyColors.BrandColor,
                ),
                child: TextField(
                  style: TextStyle(fontSize: 15),
                  onChanged: (val) => initiateSearch(val),
                  decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                        borderSide: new BorderSide(
                            color:
                                FluffyColors.LocationColor.withOpacity(0.3))),
                    hintText: 'search your daily needs',
                    hintStyle: TextStyle(fontSize: 15),
                    fillColor: FluffyColors.BrandColor,
                    hoverColor: FluffyColors.BrandColor,
                    focusColor: FluffyColors.BrandColor,
                    contentPadding: const EdgeInsets.only(left: 15.0),
                    suffixIcon: Icon(
                      Icons.search,
                      color: FluffyColors.BrandColor.withOpacity(0.3),
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(child: catPackage(context)),
            catList(context, name != "" && name != null ? true : false,
                textSearch: name),
          ],
        ),
      ),
    );
  }

  void initiateSearch(String val) {
    setState(() {
      name = val.trim();
    });
    print(name);
  }
}
