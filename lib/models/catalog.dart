class CatalogModel {
  static List<Item> items = [];

  //Get item by ID
  static Item getById(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);

  //Get Item by position
  static Item getByPosition(int pos) => items[pos];
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

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
        id: map["id"],
        name: map["name"],
        desc: map["desc"],
        price: map["price"],
        color: map["color"],
        image: map["image"]);
  }
  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "color": color,
        "image": image
      };
}
