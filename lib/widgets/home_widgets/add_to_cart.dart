import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../core/store.dart';
import '../../models/cart.dart';
import '../../models/catalog.dart';
import '../themes.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({required this.catalog});

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    // final CatalogModel _catalog = (VxState.store as MyStore).catalog;

    bool isInCart = _cart.items.contains(catalog) ?? false;
    return ElevatedButton(
        onPressed: () {
          if (!isInCart) {
            AddMutation(catalog);
            // isInCart = isInCart.toggle();
            // final _catalog = CatalogModel();
            // _cart.catalog = _catalog;
            // _cart.add(catalog);
            // setState(() {});
          }
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(MyTheme.darkBlueColor),
            shape: MaterialStateProperty.all(StadiumBorder())),
        child: isInCart ? Icon(Icons.done) : Icon(Icons.shopping_cart));
  }
}
