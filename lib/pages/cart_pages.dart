import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_project/models/cart.dart';
import 'package:my_project/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        title: "Cart".text.color(Colors.black).bold.make().centered(),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          CartTotal(),
        ],
      ),
    );
  }
}

class CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;

    return SizedBox(
      height: 250,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
            notifications: {},
            mutations: {RemoveMutation},
            builder: (context, store, status) {
              return "\$${_cart.totalPrice}"
                  .text
                  .xl5
                  .color(Colors.black)
                  .make();
            },
          ),
          40.widthBox,
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: "Buying not supported yet".text.white.make()));
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.deepPurple)),
            child: "Buy".text.white.make(),
          )
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final _cart = (VxState.store as MyStore).cart;

    return _cart.items.isEmpty
        ? "Nothing To Show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              trailing: IconButton(
                icon: Icon(Icons.remove_circle_outline_outlined),
                onPressed: () => RemoveMutation(_cart.items[index])
                // _cart.remove(_cart.items[index]);
                // setState(() {});
                ,
              ),
              title: _cart.items[index].name.text.make(),
            ),
          );
  }
}
