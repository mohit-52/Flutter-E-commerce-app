
class Product{
  int? _totalSize;
  int? _typeId;
  int? _offSet;
  late List<ProductModel> _products;
  List<ProductModel> get products=>_products;

  Product({required totalSize, required typeId, required offSet, required products}){
    this._totalSize = totalSize;
    this._typeId = typeId;
    this._offSet = offSet;
    this._products = products;
  }

  Product.fromJson(Map<String, dynamic> json){
    _totalSize = json['totalSize'];
    _typeId = json['typeId'];
    _offSet = json['offSet'];
    if (json['products'] != null){
      _products  = <ProductModel>[];
      (json['products'] as List).forEach((v){
        _products!.add(ProductModel.fromJson(v));
      });
    }


  }
}

class ProductModel{
  int? id;
  String? name;
  String? description;
  int? price;
  int? stars;
  String? img;
  String? location;
  String? createdAt;
  String? updatedAt;
  int? typeId;

  ProductModel({this.id, this.name, this.description, this.price, this.stars, this.img, this.location, this.createdAt, this.updatedAt, this.typeId});

  ProductModel.fromJson(Map<String, dynamic>json){
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    stars = json['price'];
    img = json['img'];
    location = json['location'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    typeId = json['typeId'];

  }
}