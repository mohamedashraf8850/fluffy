import  'package:fluffyclientside/utlis/Exports.dart';

class EditCartPage extends StatefulWidget {
  @override
  _EditCartPageState createState() => _EditCartPageState();
}

class _EditCartPageState extends State<EditCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: cartAppBar(title: 'Edit your cart',value: 25),
      body: ListView.builder(itemBuilder: (context,index){
        return null;
      }),
    );
  }
}
