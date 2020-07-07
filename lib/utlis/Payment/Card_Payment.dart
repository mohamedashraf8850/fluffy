import 'dart:convert';

import 'package:fluffyclientside/utlis/Exports.dart';
import 'package:http/http.dart' as http;

class CheckOut {
  static const _tokenUrl = 'https://api.sandbox.checkout.com/tokens';
  static const _paymentUrl = 'https://api.sandbox.checkout.com/payments';

  static const _pubKey = 'pk_test_a2917468-6966-4c29-961d-edbacba42514';
  static const _sicKey = 'sk_test_a17c4169-268e-437d-936a-1f57128f9cb5';
String errorData;

  static const Map<String, String> _tokenHeader = {
    'Content-Type': 'Application/json',
    'Authorization': _pubKey
  };

  static const Map<String, String> _paymentHeader = {
    'Content-Type': 'Application/json',
    'Authorization': _sicKey
  };

  Future<String> _getToken(PaymentCard card) async {
    Map<String, String> body = {
      'type': 'card',
      'number': card.number,
      'expiry_month': card.expiry_month,
      'expiry_year': card.expiry_year
    };

    http.Response response = await http.post(_tokenUrl,
        headers: _tokenHeader, body: jsonEncode(body));
    var data = jsonDecode(response.body);

    switch (response.statusCode) {
      case 201:
        return data['token'];
        break;
      default:
        errorData = data['error_codes'].toString();
        break;
    }
  }

  Future<String> makePayment(PaymentCard card, int amount) async {
    String token = await _getToken(card);
    Map<String, dynamic> body = {
      'source': {
        'type': 'token',
        'token': token,
      },
      'amount': amount,
      'currency': 'EGP'
    };
    http.Response response = await http.post(_paymentUrl, headers: _paymentHeader, body: jsonEncode(body));
    var data = jsonDecode(response.body);

    switch (response.statusCode) {
    case 201:
        return 'Approved';
        break;
      default:
        return errorData;
        break;
    }
  }
}
