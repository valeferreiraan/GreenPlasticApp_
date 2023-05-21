import 'dart:js';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greenplastic_app/constants.dart';
import 'package:greenplastic_app/ui/controllers/Cart_controller.dart';
import 'package:badges/badges.dart' as b;
import 'package:provider/provider.dart';
import 'package:greenplastic_app/ui/controllers/DataBase_temporal.dart';

class HomePageCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*AppBar(
      centerTitle: true,
      title: const Text('Lista de Productos'),
      actions: [
        b.Badge(
          badgeContent: Consumer<CartProvider>(
            builder: (context, value, child) {
              return Text(
                value.getCounter().toString(),
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              );
            },
          ),
          position: const b.BadgePosition(start: 30, bottom: 30),
          child: IconButton(
            onPressed: () {
              //Navigator.push(context,
              //  MaterialPageRoute(builder: (context) => const CartScreen())); //CartScreen() es la pantalla de resumen del carritos
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ),
        const SizedBox(
          width: 20.0,
        ),
      ],
    );*/
    return ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
        shrinkWrap: true,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.blueGrey.shade200,
            elevation: 5.0,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    width: 130,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 5.0,
                        ),
                        RichText(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          text: TextSpan(
                              text: 'Name: ',
                              style: TextStyle(
                                  color: Colors.blueGrey.shade800,
                                  fontSize: 16.0),
                              children: [
                                TextSpan(
                                    text:
                                        '${products[index].name.toString()}\n',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                              ]),
                        ),
                        RichText(
                          maxLines: 1,
                          text: TextSpan(
                              text: 'Unit: ',
                              style: TextStyle(
                                  color: Colors.blueGrey.shade800,
                                  fontSize: 16.0),
                              children: [
                                TextSpan(
                                    text:
                                        '${products[index].unit.toString()}\n',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                              ]),
                        ),
                        RichText(
                          maxLines: 1,
                          text: TextSpan(
                              text: 'Price: ' r"$",
                              style: TextStyle(
                                  color: Colors.blueGrey.shade800,
                                  fontSize: 16.0),
                              children: [
                                TextSpan(
                                    text:
                                        '${products[index].price.toString()}\n',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                              ]),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blueGrey.shade900),
                      onPressed: () {
                        saveData(index);
                      },
                      child: const Text('Add to Cart')),
                ],
              ),
            ),
          );
        });
  }
}

final cart = Provider.of<CartProvider>(context as BuildContext);

void saveData(int index) {
  var dbHelper;
  dbHelper
      .insert(
    Cart(
      id: index,
      productId: index.toString(),
      productName: products[index].name,
      initialPrice: products[index].price,
      productPrice: products[index].price,
      quantity: ValueNotifier(1),
      unitTag: products[index].unit,
    ),
  )
      .then((value) {
    cart.addTotalPrice(products[index].price.toDouble());
    cart.addCounter();
    print('Product Added to cart');
  }).onError((error, stackTrace) {
    print(error.toString());
  });
}
