import 'package:fluffyclientside/utlis/Exports.dart';

class FluffyColors {
  static const BrandColor = Color(0xFF006661);
  static const VerticalColor = Color(0xFFFDD7AB);
  static const TextColor = Color(0xFF3E3E3E);
  static const LocationColor = Color(0xFF7F7F7F);
}

Widget fluffyCart() {
  return Badge(
    badgeContent: Text('0'),
    child: Image.asset('assets/cartIcon.png'),
    animationType: BadgeAnimationType.slide,
  );
}
