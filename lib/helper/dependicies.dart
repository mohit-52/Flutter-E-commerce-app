import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/data/api/apiClient.dart';
import 'package:food_delivery/data/repository/cart_repo.dart';
import 'package:get/get.dart';

import '../data/repository/popular_product_repo.dart';
import '../data/repository/recommended_product_repo.dart';
import '../utils/app_constants.dart';

Future<void> init()async {
  // API Clinet
Get.lazyPut(()=> ApiClient(appBaseUrl: AppConstants.BASE_URL));

// Repo
Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
Get.lazyPut(()=> RecommendedProductRepo(apiClient: Get.find()));
Get.lazyPut(()=> CartRepo());

// Controllers
Get.lazyPut(() => PopularProductContoller(popularProductRepo: Get.find()));
Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));
Get.lazyPut(() => CartController(cartRepo: Get.find()));
}