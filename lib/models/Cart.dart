import 'package:fluffyclientside/utlis/Exports.dart';

class Cart extends ChangeNotifier {
  List<Item> _items = [];
  List<Item> _viewItems = [];
  double _totalPrice = 0.0;

  void add(Item item) {
     var index  = _items.indexWhere((note) => note.title.startsWith(item.title));
     print(index);
     if (index != -1){
       _totalPrice += item.price;
       _items[index].count++;
       _items[index].price += item.price;
     }else{
       _items.add(item);
       _totalPrice += item.price;
     }
     print(_totalPrice);
     notifyListeners();

  }

  void remove(Item item) {
    var index  = _items.indexWhere((note) => note.title.startsWith(item.title));
    _totalPrice -= item.price;
    _items.remove(index);
    notifyListeners();
  }

  void removeItem(Item item) {
    var index  = _items.indexWhere((note) => note.title.startsWith(item.title));
    print(index);
    if (index != -1){
      _totalPrice -= item.price;
      _items[index].count--;
      _items[index].price -= item.price;
    }
    print(_totalPrice);
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
  List<Item> get viewItems {
    return _viewItems;
  }
}
