import 'package:get/get.dart';

import '../data/repository/popular_product_repo.dart';
import '../models/products_model.dart';

class PopularProductContoller extends GetxController{
final PopularProductRepo popularProductRepo;
PopularProductContoller({required this.popularProductRepo});
List<dynamic> _popularProductList = [];
List<dynamic> get popularProductList => _popularProductList;

Future<void> getPopularProductList() async{
  Response response = await popularProductRepo.getPopularProductList();
  if(response.statusCode == 200){
print("COntrolller has been initialised");
    _popularProductList = [];
    _popularProductList.addAll(Product.fromJson(response.body).products);
    update();
  }
}

}