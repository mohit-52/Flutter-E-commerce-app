import 'package:food_delivery/pages/food/popular_food_detail.dart';
import 'package:food_delivery/pages/food/recommended_food_detail.dart';
import 'package:food_delivery/pages/home/main_food_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";

  // Function for passing argument to the route Screen
  static String getRecommendedProduct(int pageId) => '$recommendedFood?pageId=$pageId';

  static String getPopularProduct(int pageId) => '$popularFood?pageId=$pageId';

  static String getInitial() => "$initial";

  static List<GetPage> routes = [
    GetPage(
        name: "/",
        page: () => MainFoodPage(),
        transition: Transition.cupertino),
    GetPage(
        name: popularFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          return PopularFoodDetail(pageId: int.parse(pageId!));
        },
        transition: Transition.cupertino),
    GetPage(
        name: recommendedFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          return RecommendedFoodDetail(pageId: int.parse(pageId!),);
        },
        transition: Transition.cupertino),
  ];
}
