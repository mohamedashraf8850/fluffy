import 'package:fluffyclientside/utlis/Exports.dart';

UserModel userData;

class MainProfilePage extends StatefulWidget {
  @override
  _MainProfilePageState createState() => _MainProfilePageState();
}


class _MainProfilePageState extends State<MainProfilePage> {
  final AuthService auth = AuthService();
  final CollectionReference usersRef = Firestore.instance.collection('Users');

  TextEditingController nameControlller = new TextEditingController();
  TextEditingController phoneControlller = new TextEditingController();
  TextEditingController mailControlller = new TextEditingController();
 // TextEditingController oPassControlller = new TextEditingController();
  TextEditingController nPassControlller = new TextEditingController();
  TextEditingController vnPassControlller = new TextEditingController();
  TextEditingController loginpassControlller = new TextEditingController();
  TextEditingController addressControlller = new TextEditingController();
  TextEditingController blockControlller = new TextEditingController();
  TextEditingController floorControlller = new TextEditingController();

  final GlobalKey<FormState> nameKey = GlobalKey<FormState>();
  final GlobalKey<FormState> phoneKey = GlobalKey<FormState>();
  final GlobalKey<FormState> mailKey = GlobalKey<FormState>();
  final GlobalKey<FormState> loginmailKey = GlobalKey<FormState>();
 // final GlobalKey<FormState> oPassKey = GlobalKey<FormState>();
  final GlobalKey<FormState> nPassKey = GlobalKey<FormState>();
  final GlobalKey<FormState> vnPassKey = GlobalKey<FormState>();
  final GlobalKey<FormState> loginPassKey = GlobalKey<FormState>();
  final GlobalKey<FormState> addressKey = GlobalKey<FormState>();
  final GlobalKey<FormState> blockKey = GlobalKey<FormState>();
  final GlobalKey<FormState> floorKey = GlobalKey<FormState>();

  bool swValue = false , update = false;
  String switchText;

  FirebaseUser user;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;


  @override
  void initState() {
    switchText = 'Register';

    if (currentUser != null) {
      setState(() {
        update = true;
      });
      dataofUser();
    } else {
      setState(() {
        update = false;
      });
    }
    super.initState();
  }

  void _onChangedRadio(bool value) => setState(() {
        swValue = value;
        if (swValue == true) {
          switchText = 'Login';
        } else {
          switchText = 'Register';
        }
      });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      backgroundColor: Colors.white,
      appBar: profileAppBar(context),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  update == false
                      ? SwitchListTile(
                          value: swValue,
                          activeColor: FluffyColors.BrandColor,
                          inactiveTrackColor: FluffyColors.BrandColor,
                          onChanged: _onChangedRadio,
                          title: new Text(switchText,
                              style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                        )
                      : Container(),
                  ExpansionTile(
                    leading: Icon(
                      Icons.account_circle,
                      color: FluffyColors.BrandColor,
                    ),
                    title: Text(
                      "Personal Information",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: FluffyColors.BrandColor, fontSize: 20),
                    ),
                    children: <Widget>[
                      swValue == false
                          ? personalInfo(
                          update == true ? true : false,
                              mailControlller: mailControlller,
                              nameControlller: nameControlller,
                              nPassControlller: nPassControlller,
                              //oPassControlller: oPassControlller,
                              phoneControlller: phoneControlller,
                              vnPassControlller: vnPassControlller,
                              mailKey: mailKey,
                              nameKey: nameKey,
                              nPassKey: nPassKey,
                             // oPassKey: oPassKey,
                              phoneKey: phoneKey,
                              vnPassKey: vnPassKey)
                          : loginInfo(
                              mailControlller: mailControlller,
                              passController: loginpassControlller,
                              mailKey: loginmailKey,
                              passKey: loginPassKey),
                      swValue == false
                          ? ExpansionTile(
                              leading: Icon(
                                Icons.location_on,
                                color: FluffyColors.BrandColor,
                              ),
                              title: Text(
                                "Address details",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: FluffyColors.BrandColor,
                                    fontSize: 15),
                              ),
                              children: <Widget>[
                                addressDetails(
                                    context, update == true ? true : false,
                                    addressControlller: addressControlller,
                                    blockControlller: blockControlller,
                                    floorControlller: floorControlller,
                                    addressKey: addressKey,
                                    blockKey: blockKey,
                                    floorKey: floorKey)
                              ],
                            )
                          : Container(),
                      Visibility(
                        child: RaisedButton(
                          onPressed: () {
                            if (update == false) {
                              if (swValue == false) {
                                if (nameKey.currentState.validate() &&
                                    phoneKey.currentState.validate() &&
                                    mailKey.currentState.validate() &&
                                    nPassKey.currentState.validate() &&
                                    vnPassKey.currentState.validate() &&
                                    addressKey.currentState.validate() &&
                                    blockKey.currentState.validate() &&
                                    floorKey.currentState.validate() &&
                                    mailControlller.text.isNotEmpty &&
                                    nameControlller.text.isNotEmpty &&
                                    nPassControlller.text.isNotEmpty &&
                                    phoneControlller.text.isNotEmpty &&
                                    vnPassControlller.text.isNotEmpty) {
                                  createAccount();
                                }
                              } else {
                                if (loginmailKey.currentState.validate() &&
                                    loginPassKey.currentState.validate() &&
                                    mailControlller.text.isNotEmpty &&
                                    loginpassControlller.text.isNotEmpty) {
                                  login();
                                }
                              }
                            }
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: FluffyColors.BrandColor)),
                          color: FluffyColors.BrandColor,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              switchText,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        visible: update==true?false:true,
                      ),
                    ],
                  ),
//                  ExpansionTile(
//                    leading: Icon(
//                      Icons.history,
//                      color: FluffyColors.BrandColor,
//                    ),
//                    title: Text(
//                      "Purchasing history",
//                      textAlign: TextAlign.start,
//                      style: TextStyle(
//                          color: FluffyColors.BrandColor, fontSize: 20),
//                    ),
//                    children: <Widget>[],
//                  ),
//                  ExpansionTile(
//                    leading: Icon(
//                      Icons.language,
//                      color: FluffyColors.BrandColor,
//                    ),
//                    title: Text(
//                      "Language",
//                      textAlign: TextAlign.start,
//                      style: TextStyle(
//                          color: FluffyColors.BrandColor, fontSize: 20),
//                    ),
//                    children: <Widget>[],
//                  ),
//                  ExpansionTile(
//                    leading: Icon(
//                      Icons.message,
//                      color: FluffyColors.BrandColor,
//                    ),
//                    title: Text(
//                      "Contact us",
//                      textAlign: TextAlign.start,
//                      style: TextStyle(
//                          color: FluffyColors.BrandColor, fontSize: 20),
//                    ),
//                    children: <Widget>[],
//                  ),
                ],
              ),
//              Padding(
//                padding: const EdgeInsets.only(right: 20.0, bottom: 20.0),
//                child: GestureDetector(
//                    child: Text(
//                  'Logout',
//                  style:
//                      TextStyle(color: FluffyColors.BrandColor, fontSize: 17),
//                )),
//              )
            ],
          ),
        ),
      ),
    );
  }

  void createAccount() async {
    user = await auth.signUp(mailControlller.text, vnPassControlller.text);
    if (user == null) {
      Fluttertoast.showToast(
          msg: "User already registered",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          textColor: Colors.white,
          backgroundColor: Colors.red,
          timeInSecForIosWeb: 1);
    } else {
      usersRef.document(user.uid).setData({
        "uId": user.uid,
        "userName": nameControlller.text,
        "userEmail": user.email,
        "userAddress":
            '${floorControlller.text},${blockControlller.text},${addressControlller.text}',
        "userPhone": phoneControlller.text,
        "userPassword": vnPassControlller.text
      }).then((_) {
        Fluttertoast.showToast(
            msg: "Congratulations, your account Created Successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            textColor: Colors.white,
            backgroundColor: FluffyColors.BrandColor,
            timeInSecForIosWeb: 1);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => BasicScaffold()),
            ModalRoute.withName('/'));
      });
    }
  }

  void login() async {
    user = await auth.signIn(mailControlller.text, loginpassControlller.text);

    if (user == null) {
      Fluttertoast.showToast(
          msg: "Invalid login",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          textColor: Colors.white,
          backgroundColor: Colors.red,
          timeInSecForIosWeb: 1);
    } else {
      currentUser = user;
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (BuildContext context) => BasicScaffold()),
          ModalRoute.withName('/'));
    }
  }
  dataofUser() async {
    userData = await getUserData(currentUser.uid);
    setState(() {
      nameControlller.text = userData.userName;
      phoneControlller.text = userData.userPhone;
      mailControlller.text = userData.userEmail;
      nPassControlller.text = '';
      vnPassControlller.text = '';
      addressControlller.text = userData.userAddress;
    });
  }
}


Future<UserModel> getUserData(String id) async {
  DocumentSnapshot snapshot =
  await Connections.db.collection('Users').document(id).get();
  if (snapshot.data == null) {
    return Future.value(null);
  } else {
    try {
      UserModel profileUser = UserModel.fromSnapshot(snapshot);
      return profileUser;
    } catch (err) {
      return Future.value(null);
    }
  }
}
/*
                await FirebaseAuth.instance.signOut();

 */
