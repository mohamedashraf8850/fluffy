import 'package:fluffyclientside/utlis/Exports.dart';

class Cart extends ChangeNotifier {
  List<Item> _items = [];
  double _totalPrice = 0.0;

  void add(Item item) {
     var index  = _items.indexWhere((note) => note.title.startsWith(item.title));
     print(index);
     if (index != -1){
       _items[index].count = _items[index].count+1;
       _items[index].price += item.price;
     }else{
       _items.add(item);
     }
     _totalPrice += item.price;
     notifyListeners();

  }

  void remove(Item item) {
    _totalPrice -= item.price;
    _items.remove(item);
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
