import 'package:food_delivery/pages/cart/cart_page.dart';
import 'package:food_delivery/pages/food/popular_food_detail.dart';
import 'package:food_delivery/pages/food/recommended_food_detail.dart';
import 'package:food_delivery/pages/home/home_page.dart';
import 'package:food_delivery/pages/home/main_food_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/cart-page";

  // Function for passing argument to the route Screen
  static String getInitial() => "$initial";
  static String getRecommendedProduct(int pageId, String page) => '$recommendedFood?pageId=$pageId&page=$page';
  static String getPopularProduct(int pageId, String page) => '$popularFood?pageId=$pageId&page=$page';
  static String getCartPage() => '$cartPage';


  static List<GetPage> routes = [
    GetPage(
        name: "/",
        page: () => HomePage(),
        transition: Transition.cupertino),
    GetPage(
        name: popularFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters['page'];
          return PopularFoodDetail(pageId: int.parse(pageId!), page:page!);
        },
        transition: Transition.cupertino),
    GetPage(
        name: recommendedFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters['page'];
          return RecommendedFoodDetail(pageId: int.parse(pageId!),page:page!);
        },
        transition: Transition.cupertino),
    GetPage(name: cartPage, page: (){
      return CartPage();
    }, transition: Transition.fadeIn)
  ];
}
