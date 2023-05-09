// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:my_project/models/catalog.dart';

class CartModel {
  //Singleton class
  static final cartModel = CartModel._internal();
  CartModel._internal();
  factory CartModel() => cartModel;

  //Catalog field
  late CatalogModel _catalog;

  //Collection of IDs - store Ids of each item
  final List<int> _itemIds = [];

  //Get Catalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  //Get items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  //Get Total Price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  //Add item

  void add(Item item) {
    _itemIds.add(item.id);
  }

  //Remove item

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
