import 'package:fluffyclientside/utlis/Exports.dart';
import 'package:intl/intl.dart';

class AddressDetailsPage extends StatefulWidget {
  @override
  _AddressDetailsPageState createState() => _AddressDetailsPageState();
}

class _AddressDetailsPageState extends State<AddressDetailsPage>
    with TickerProviderStateMixin {
  String radioValue = 'one';
  String choice, scheduledDateTime = '', address = '13, District 15';
  TextEditingController phoneController = new TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  void radioButtonChanges(String value) {
    setState(() {
      radioValue = value;
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
            Row(
              children: <Widget>[
                Text('Select delivery Location',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RichText(
                  text: new TextSpan(
                    text: address,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                    children: <TextSpan>[
                      new TextSpan(
                          text: ' - Madenati, Cairo',
                          style: new TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    Radio(
                      value: 'one',
                      activeColor: FluffyColors.BrandColor,
                      onChanged: radioButtonChanges,
                      groupValue: radioValue,
                    ),
                    GestureDetector(
                      child: Text('Change Address',
                          style: TextStyle(color: Colors.black, fontSize: 15)),
                      onTap: () {
                        String newAddress;
                        return showDialog<String>(
                          context: context,
                          barrierDismissible:
                              false, // dialog is dismissible with a tap on the barrier
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Enter new address'),
                              content: new Row(
                                children: <Widget>[
                                  new Expanded(
                                      child: new TextField(
                                    autofocus: true,
                                    decoration: new InputDecoration(
                                        labelText: 'new Address',
                                        hintText: 'ex. 13 District 15'),
                                    onChanged: (value) {
                                      setState(() {
                                        newAddress = value;
                                      });
                                    },
                                  ))
                                ],
                              ),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text('Cancel'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                FlatButton(
                                  child: Text('Ok'),
                                  onPressed: () {
                                    if (newAddress != null) {
                                      print(newAddress);
                                      setState(() {
                                        address = newAddress;
                                      });
                                    } else {
                                      print('Empty');
                                    }
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    )
                  ],
                ),
              ],
            ),
            ExpansionTile(
              title: Text(
                'Select delivery data and time (Optional)',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              backgroundColor: Colors.white,
              trailing: IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 15,
                ),
                onPressed: () {
                  print(DateTime.now());
                  DatePicker.showDateTimePicker(context,
                      showTitleActions: true,
                      minTime: DateTime.now(),
                      maxTime: DateTime(2025, 12, 12), onConfirm: (date) {
                    setState(() {
                      scheduledDateTime = DateFormat('yyyy-MM-dd – kk:mm').format(date) +
                          ' Cairo(CAT)';
                      print(scheduledDateTime);
                    });
                  }, currentTime: DateTime.now(), locale: LocaleType.ar);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: scheduledDateTime != '' ? 'Your Order will Arrive in ' : '',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: scheduledDateTime != '' ? '$scheduledDateTime' : '',
                        style: TextStyle(
                            fontSize: 25,
                            color: FluffyColors.BrandColor,
                            fontWeight: FontWeight.bold),
                      )
                    ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: fluffyTextField(
                context,
                controller: phoneController,
                hintText: 'Add Another Phone No. (Optional)',
                type: TextInputType.phone,
                size: 60,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
