import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_project/core/store.dart';
import 'package:my_project/models/cart.dart';
import 'dart:convert';
import 'package:my_project/models/catalog.dart';
import 'package:my_project/utils/routes.dart';
import 'package:my_project/widgets/drawer.dart';
import 'package:my_project/widgets/item_widget.dart';
import 'package:my_project/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart';
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final String url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));

    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");

    // final response = await http.get(Uri.parse(url));
    // final catalogJson = response.body;

    final decodedData = jsonDecode(catalogJson);
    final productData = decodedData['products'];
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
    print(productData);
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (ctx, store, status) => FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          backgroundColor: context.theme.buttonColor,
          child: Icon(Icons.add_shopping_cart_outlined),
        ).badge(
            color: Vx.red500,
            size: 22,
            count: _cart.items.length,
            textStyle:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: SafeArea(
          child: Container(
              padding: Vx.m32,
              child: Column(
                children: [
                  CatalogHeader(),
                  if (CatalogModel.items != null &&
                      CatalogModel.items.isNotEmpty)
                    CatalogList().py16().expand()
                  else
                    CircularProgressIndicator().centered().expand(),
                ],
              ))),
    );
  }
}

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({super.key, required this.image}) : assert(image != null);

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .rounded
        .p8
        .color(MyTheme.creameColor)
        .make()
        .p16();
    // .w40(context);
  }
}
