import 'package:fluffyclientside/utlis/Exports.dart';

class Cart extends ChangeNotifier {
  static List<Item> _items = [];
  double _totalPrice = 0.0;
  static int counter;
  void add(Item item) {
    var index = _items.indexWhere((note) => note.title.startsWith(item.title));
    if (index != -1) {
      _items[index].count++;
      _items[index].price = _items[index].price + item.priceView;
    } else {
      _items.add(item);
    }
    _totalPrice = _totalPrice + item.priceView;
    notifyListeners();
  }

  void remove(Item item) {
    var index = _items.indexWhere((note) => note.title.startsWith(item.title));
    _totalPrice -= item.price;
    item.price = item.priceView;
    counter = 0;
    item.count = item.countView;
    _items.remove(index);
    notifyListeners();
  }

  void removeItem(Item item) {
    var index = _items.indexWhere((note) => note.title.startsWith(item.title));

    if (index != -1) {
      _totalPrice -= item.priceView;
      _items[index].count--;
      _items[index].price = _items[index].price - item.priceView;
    }
    print(counter);
    notifyListeners();
  }

  int get count {
    return _items.length;
  }

  double get totalPrice {
    return _totalPrice;
  }

  List<Item> get basketItems {
    return _items;
  }
}
