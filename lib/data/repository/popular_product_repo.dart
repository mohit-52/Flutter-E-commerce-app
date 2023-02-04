import 'package:food_delivery/data/api/apiClient.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;

  PopularProductRepo({
    required this.apiClient,
  });

  Future<Response> getPopularProductList()  async{
    return await apiClient.getData("end point url");
  }
}
