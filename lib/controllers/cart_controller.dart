import 'package:get/get.dart';
import '../data/repository/cart_repo.dart';
import '../models/cart_model.dart';
import '../models/products_model.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});

  // Map for saving the item info added in the cart
  Map<int, CartModel> _items = {};
  Map<int, CartModel> get items => _items;

  // Function for adding item in the cart
  void addItem(ProductModel product, int quantity) {
    if(_items.containsKey(product.id!)){
      _items.update(product.id!, (value){
        return CartModel(
          id: value.id,
          name: value.name,
          price: value.price,
          img: value.img,
          quantity: value.quantity!+quantity,
          isExist: true,
          time: DateTime.now().toString(),
        );      });
    }else{
      _items.putIfAbsent(product.id!, () {  // Check if the item ID (product.id!)exist in the model or not
        return CartModel(
          id: product.id,
          name: product.name,
          price: product.price,
          img: product.img,
          quantity: quantity,
          isExist: true,
          time: DateTime.now().toString(),
        );
      });
    }
  }

  // Function for checking if Item is already present in the cart or not
  bool existInCart(ProductModel product){
    if(_items.containsKey(product.id)){
      return true;
    }else{
      return false;
    }
  }

  int getQuantity(ProductModel product){
    var quantity;
    if(_items.containsKey(product.id!)){ // check if the ID is present already
      _items.forEach((key, value) {      // for loop for checking the item No.
        if(key==product.id!){
          quantity = value.quantity!;    // assigning the quantity in our new variable i.e. quantity
        }
      });
    }
    return quantity;
  }
}
