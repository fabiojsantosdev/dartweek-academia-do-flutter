import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/models/product_model.dart';
import 'package:vakinha_burger_mobile/app/models/shopping_card_model.dart';

class ShoppingCardService extends GetxService {
  final _shopppingCard = <int, ShoppingCardModel>{}.obs;

  List<ShoppingCardModel> get products => _shopppingCard.values.toList();

  int get totalProducts => _shopppingCard.values.length;

  ShoppingCardModel? getById(int id) => _shopppingCard[id];

  double get totalValue{
    return _shopppingCard.values.fold(0, (totalValue, shoppingCardModel) {
      totalValue += shoppingCardModel.product.price * shoppingCardModel.quantity;
      return totalValue;
    });
  }

  void addAndRemoveProductInShoppingCard(
    ProductModel product, {
    required int quantity,
  }) {
    if (quantity == 0) {
      _shopppingCard.remove(product.id);
    } else {
      _shopppingCard.update(
        product.id,
        (product) {
          product.quantity = quantity;
          return product;
        },
        ifAbsent: () {
          return ShoppingCardModel(quantity: quantity, product: product);
        },
      );
    }
  }

  void clear() => _shopppingCard.clear();
}
