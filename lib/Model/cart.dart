import 'item.dart';

class Cart {
  final FlowerItem item;

  final int numOfItem;

  Cart({required this.item, required this.numOfItem});
}

class getTotal {
  double get subTotal => demoCarts.fold(
      0, (total, current) => total + (current.item.price! * current.numOfItem));

  String get subTotalString => subTotal.toString();

  double deliveryFee() {
    if (subTotal >= 100.0) {
      return 0;
    } else {
      return 20;
    }
  }

  double total() {
    return subTotal + deliveryFee();
  }
}
// Demo data for our cart

List<Cart> demoCarts = [];
List OrderCart = List<Cart>.from(demoCarts);
