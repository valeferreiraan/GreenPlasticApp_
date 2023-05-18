import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greenplastic_app/constants.dart';
import 'package:greenplastic_app/ui/controllers/Cart_controller.dart';

class HomePage extends StatelessWidget{ 
  @override
  Widget build(BuildContext context) {
    AppBar(
    centerTitle: true,
    title: const Text('Product List'),
    actions: [
      Badge(
        badgeContent: Consumer<CartProvider>(
          builder: (context, value, child) {
            return Text(
              value.getCounter().toString(),
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            );
          },
        ),
        position: const BadgePosition(start: 30, bottom: 30),
        child: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CartScreen()));
          },
          icon: const Icon(Icons.shopping_cart),
        ),
      ),
      const SizedBox(
        width: 20.0,
      ),
    ],
    );
    
    // TODO: implement build
    throw UnimplementedError();
  }

}