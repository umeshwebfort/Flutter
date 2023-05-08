import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:my_project/models/catalog.dart';
import 'package:my_project/utils/routes.dart';
import 'package:my_project/widgets/drawer.dart';
import 'package:my_project/widgets/item_widget.dart';
import 'package:my_project/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    final productData = decodedData['products'];
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
    print(productData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
        backgroundColor: context.theme.buttonColor,
        child: Icon(Icons.add_shopping_cart_outlined),
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
