import 'package:flutter/material.dart';
import 'package:my_project/models/catalog.dart';
import 'package:my_project/widgets/drawer.dart';
import 'package:my_project/widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dummyData = List.generate(15, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("MY RENT WORK")),
      ),
      body: ListView.builder(
          itemCount: dummyData.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: dummyData[index],
            );
          }),
      drawer: MyDrawer(),
    );
  }
}
