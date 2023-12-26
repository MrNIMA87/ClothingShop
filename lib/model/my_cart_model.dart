import 'package:clothing_shop/gen/assets.gen.dart';
import 'package:clothing_shop/view/widgets/my_cart/my_cart_product_button.dart';
import 'package:get/get.dart';

class MyCartProductModel {
  // String? id;
  String title;
  String price;
  String size;
  String image;
  RxInt numberProduct = 0.obs;
  // String category;
  MyCartProductModel({
    // required this.id,
    this.title = '',
    this.price = '',
    //  this.category,
    this.size = '',
    required this.numberProduct,
    this.image = '',
  });

  // ProductsModel.fromJson(Map<String, dynamic> json) {
  //   id = json['id'].toString();
  //   title = json['title'];
  //   price = json['price'].toString();
  //   size = json['size'];
  //   category = json['category'];
  //   image = json['image'];
  // }
}

RxList<MyCartProductModel> myCartProducts = [
  MyCartProductModel(
    image: Assets.images.explore22.path,
    price: '85.36',
    size: 'XLL',
    title: 'Brown Jacket',
    numberProduct: 1.obs,
  ),
  
].obs;
