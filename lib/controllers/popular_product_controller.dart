import 'package:get/get.dart';

import '../data/repository/popular_product_repo.dart';

class PopularProductContoller extends GetxController{
final PopularProductRepo popularProductRepo;
PopularProductContoller({required this.popularProductRepo});
List<dynamic> _popularProductList = [];

Future<void> getPopularProductList() async{
  Response response = await popularProductRepo.getPopularProductList();
  if(response.statusCode == 200){
    _popularProductList = [];
    // _popularProductList.addAll();
    update();
  }
}

}