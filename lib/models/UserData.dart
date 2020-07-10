import 'package:fluffyclientside/utlis/Exports.dart';

class UserModel {
  String uId, userName, userEmail, userAddress, userPhone, userPassword;

  UserModel({
    this.uId,
    this.userName,
    this.userEmail,
    this.userAddress,
    this.userPhone,
    this.userPassword,
  });

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    this.uId = snapshot.documentID;
    this.userName = snapshot.data["userName"];
    this.userEmail = snapshot.data["userEmail"];
    this.userAddress = snapshot.data["userAddress"];
    this.userPhone = snapshot.data["userPhone"];
    this.userPassword = snapshot.data["userPassword"];
  }
}
