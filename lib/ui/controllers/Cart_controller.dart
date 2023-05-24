import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:greenplastic_app/ui/database/database.dart';
import 'database_controller.dart';

class ShoppingCart {
  final List<CartItem> cartItems = [];
  DatabaseController databaseController = Get.find();

  void addToCart(CartItem item) {
    cartItems.add(item);
  }

  void removeFromCart(CartItem item) {
    cartItems.remove(item);
  }
}

class CartItem {
  final String productId;
  final String productName;
  final double productPrice;
  final int quantity;

  CartItem({
    required this.productId,
    required this.productName,
    required this.productPrice,
    required this.quantity,
  });
}

class CartController {
  final ShoppingCart shoppingCart = ShoppingCart();

  void addToCart(CartItem item) {
    shoppingCart.addToCart(item);
  }

  void removeFromCart(CartItem item) {
    shoppingCart.removeFromCart(item);
  }
}

