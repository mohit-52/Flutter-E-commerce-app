import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:get/get.dart';

import '../data/repository/popular_product_repo.dart';
import '../models/products_model.dart';

class PopularProductContoller extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductContoller({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];

  List<dynamic> get popularProductList => _popularProductList;

  bool _isLoaded = false;

  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;
  int _inCartItems = 0;
  int get inCartItems => _inCartItems;



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

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      if (_quantity < 20) {
        _quantity++;
      } else {
        Get.snackbar("Item Count", "You can not increase more!",
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } else {
      if (_quantity > 0) {
        _quantity--;
      } else {
        Get.snackbar(
          "Item Count",
          "You can not decrease more!",
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }
    update();
  }

  void initProduct(CartController cart){
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
//     var exist = false;
//     exist = _cart.existInCart(product);
// print("Exist or not: "+ exist.toString());
    // if exist
    // get it from local sotrage _inCartItems = 3;
  }

  void addItem(ProductModel product){
if(quantity>0){
  _cart.addItem(product, _quantity);
  _quantity = 0;
  _cart.items.forEach((key, value) {
    print("Key is: "+value.id.toString()+"And Quantity is: " + value.quantity.toString());

  });
} else{
  Get.snackbar("Item Count", "Add atleast 1 item!",
      backgroundColor: Colors.red, colorText: Colors.white);
}
  }
}
