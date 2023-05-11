import 'package:flutter/material.dart';
import 'package:my_project/pages/home_detail_page.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/catalog.dart';
import '../themes.dart';
import '../../pages/home_page.dart';
import '../../models/cart.dart';
import 'add_to_cart.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return !context.isMobile
        ? GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 20.0),
            shrinkWrap: true,
            itemCount: CatalogModel.items.length,
            itemBuilder: (context, index) {
              final catalog = CatalogModel.items[index];
              return InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              HomeDetailsPage(catalog: catalog))),
                  child: CatalogItem(catalog: catalog));
            },
          )
        : ListView.builder(
            itemCount: CatalogModel.items.length,
            itemBuilder: (context, index) {
              final catalog = CatalogModel.items[index];
              return InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              HomeDetailsPage(catalog: catalog))),
                  child: CatalogItem(catalog: catalog));
            },
          );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({super.key, required this.catalog})
      : assert(catalog != null);

  @override
  Widget build(BuildContext context) {
    var children2 = [
      Hero(
          tag: Key(catalog.id.toString()),
          child: CatalogImage(image: catalog.image)),
      Expanded(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          catalog.name.text.lg.color(MyTheme.darkBlueColor).make(),
          catalog.desc.text.textStyle(context.captionStyle).make(),
          10.heightBox,
          ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: EdgeInsets.zero,
            children: [
              "\$${catalog.price}".text.bold.xl.make(),
              AddToCart(catalog: catalog)
            ],
          ).pOnly(right: 8.0)
        ],
      ))
    ];
    return VxBox(
            child: context.isMobile
                ? Row(
                    children: children2,
                  )
                : Column(
                    children: children2,
                  ))
        .white
        .roundedLg
        .square(150)
        .make()
        .py16();
  }
}
