import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_project/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

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
    return SizedBox(
      height: 250,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$9999".text.xl5.color(Colors.black).make(),
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

class _CartList extends StatefulWidget {
  const _CartList({super.key});

  @override
  State<_CartList> createState() => _CartListState();
}

class _CartListState extends State<_CartList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(
          icon: Icon(Icons.remove_circle_outline_outlined),
          onPressed: () {},
        ),
        title: "Item 1".text.make(),
      ),
    );
  }
}
