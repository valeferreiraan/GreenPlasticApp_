import 'dart:js';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greenplastic_app/constants.dart';
import 'package:greenplastic_app/ui/controllers/Cart_controller.dart';
import 'package:badges/badges.dart' as b;
import 'package:provider/provider.dart';
import 'package:greenplastic_app/ui/controllers/DataBase_temporal.dart';

import 'package:flutter/material.dart';

class HomePageCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: backColor, // Color de fondo deseado para el ListView
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
        shrinkWrap: true,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Card(
            color: Color3,
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
                            style: Theme.of(context).textTheme.bodySmall,
                            children: [
                              TextSpan(
                                text: '${products[index].name.toString()}\n',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          maxLines: 1,
                          text: TextSpan(
                            text: 'Unit: ',
                            style: Theme.of(context).textTheme.bodySmall,
                            children: [
                              TextSpan(
                                text: '${products[index].unit.toString()}\n',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          maxLines: 1,
                          text: TextSpan(
                            text: 'Price: ' r"$",
                            style: Theme.of(context).textTheme.bodySmall,
                            children: [
                              TextSpan(
                                text: '${products[index].price.toString()}\n',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      saveData(index);
                    },
                    child: Text('Ver más',
                        style: Theme.of(context).textTheme.labelLarge),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
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
