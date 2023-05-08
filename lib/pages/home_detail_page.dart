import 'package:flutter/material.dart';
import 'package:my_project/models/catalog.dart';
import 'package:my_project/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailsPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailsPage({super.key, required this.catalog})
      : assert(catalog != null);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // elevation: 0,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(MyTheme.darkBlueColor),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    child: "Add to cart".text.make())
                .wh(130, 50)
                .py16()
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Hero(
                tag: Key(catalog.id.toString()),
                child: Image.network(catalog.image).h32(context)),
            Expanded(
                child: VxArc(
              height: 30.0,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                width: context.screenWidth,
                color: Colors.white,
                child: Column(
                  children: [
                    catalog.name.text.xl4.bold
                        .color(MyTheme.darkBlueColor)
                        .make(),
                    catalog.desc.text.xl.textStyle(context.captionStyle).make(),
                    10.heightBox,
                    "VelocityX is 100% free and open source. We encourage and support an active, healthy community that accepts contributions from the public – including you. There are a couple of ways in which you can contribute to the growing community of VelocityX."
                        .text
                        .textStyle(context.captionStyle)
                        .make()
                        .p8()
                  ],
                ).py64(),
              ),
            ))
          ],
        ).py16(),
      ),
    );
  }
}
