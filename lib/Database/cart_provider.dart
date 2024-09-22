import 'package:ecommerce/Database/db.dart';
import 'package:ecommerce/Models/dart_model.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider with ChangeNotifier {
  DBHelper db = DBHelper();
  int _counter = 0;
  int get counter => _counter;

  int _totalprice = 0;
  int get totalprice => _totalprice;

  late Future <List<Cart>>_cart;
   Future <List<Cart>> get cart => _cart;
   Future <List<Cart>> getData(){
    _cart = db.getCartList();
    return _cart;
   }
  


  void _setPrefsItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('cart_item',_counter);
    prefs.setInt('cart_price', _totalprice);
    notifyListeners();
  }
  void _getPrefsItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
  _counter = prefs.getInt('cart_item') ?? 0;
  _totalprice = prefs.getInt('cart_item') ?? 0;
     notifyListeners();
  }
   void addTotalPrice(int productprice){
   _totalprice = _totalprice + productprice;
    _setPrefsItems();
    notifyListeners();
  }
   void removeTotalPrice(int productprice){
    _totalprice = _totalprice - productprice;
    _setPrefsItems();
    notifyListeners();
  }
   int getTotalPrice(){
    _getPrefsItems();
    return _totalprice;
  }
  void addCounter(){
    _counter++;
    _setPrefsItems();
    notifyListeners();
  }
   void removeCounter(){
    _counter--;
    _setPrefsItems();
    notifyListeners();
  }
   int getCounter(){
    _getPrefsItems();
    return _counter;
  }
}
