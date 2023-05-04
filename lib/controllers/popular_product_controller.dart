import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:get/get.dart';

import '../data/repository/popular_product_repo.dart';
import '../models/products_model.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;

  int _inCartItems = 0;
  int get inCartItems => _inCartItems+_quantity;

  late CartController _cart;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;

      update();
    }
  }

  // void setQuantity(bool isIncrement) {
  //   if (isIncrement) {
  //     if ((_inCartItems + _quantity) < 20) {
  //       _quantity++;
  //     } else {
  //       Get.snackbar("Item Count", "You can not increase more!",
  //           backgroundColor: Colors.red, colorText: Colors.white);
  //     }
  //   } else {
  //     if ((_inCartItems + _quantity) > 0) {
  //       _quantity--;
  //     } else {
  //       Get.snackbar(
  //         "Item Count",
  //         "You can not decrease more!",
  //         backgroundColor: Colors.red,
  //         colorText: Colors.white,
  //       );
  //     }
  //   }
  // }
  void setQuantity (bool isIncrement){
    if(isIncrement){
      _quantity =checkQuantity (_quantity+1);
      // print("no of items is  "+_quantity.toString());
    }else{
      _quantity =checkQuantity (_quantity-1);
      // print("decrement "+_quantity.toString());
    }
    update();
  }

  int checkQuantity (int quantity) {
    if((_inCartItems+quantity)<0) {
      Get.snackbar ("Item count", "You can reduce more !",
        backgroundColor: Colors.red.withOpacity(0.9),
        colorText: Colors.white,
      );
      if(_inCartItems>0){
        _quantity = -_inCartItems;
        return _quantity;
      }
      return 0;
    }else if((_inCartItems+quantity)>20){
      Get.snackbar ("Item count", "You can't add more !",
        backgroundColor: Colors.white,
        colorText: Colors.white,
      );
      return 20;
    }else{
      return quantity;}}

  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);
    print("Exist or not: $exist");
    if (exist) {
      _inCartItems = cart.getQuantity(product);
    }
    print("The quantity in the cart is " + _inCartItems.toString());
    // get it from local storage _inCartItems = 3;
  }

  void addItem(ProductModel product) {
      _cart.addItem(product, _quantity);

      _quantity = 0;
      _inCartItems = _cart.getQuantity(product);

      _cart.items.forEach((key, value) {
        print("Key is: " +
            value.id.toString() +
            "And Quantity is: " +
            value.quantity.toString());
      });

    update();
  }

  int get totalItems{
    return _cart.totalItems;
  }
}
