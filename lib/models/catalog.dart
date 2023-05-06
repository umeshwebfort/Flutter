class CatalogModel {
  static final List<Item> items = [
    Item(
        id: 101,
        name: "iPhone 12 Pro",
        desc: "Apple iPhone 12th Generation",
        price: 999,
        color: "#33505a",
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQyIkWCF_2NnTM-imjWtFuzsPEWFYYH-Vk76A&usqp=CAU"),
  ];
}

class Item {
  //modal class
  String name, desc, color, image;
  int id, price;
  //  List<int> marks;

  Item({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.color,
    required this.image,
  });
}
