import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/data/api/apiClient.dart';
import 'package:get/get.dart';

import '../data/repository/popular_product_repo.dart';

Future<void> init()async {
  // API Clinet
Get.lazyPut(()=> ApiClient(appBaseUrl: "https://www.gymmi.fit"));

// Repo
Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

// Controllers
Get.lazyPut(() => PopularProductContoller(popularProductRepo: Get.find()));


}