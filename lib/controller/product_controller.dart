import 'dart:developer';

import 'package:clothing_shop/model/products_model.dart';
import 'package:clothing_shop/service/get.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  RxList<ProductsModel> products = RxList();
  RxBool loading = false.obs;
  @override
  void onInit() {
    super.onInit();
    getProducts();
  }

  getProducts() async {
    loading.value = true;
    try {
      var response =
          await GetService().getMethod('https://fakestoreapi.com/products/');
      if (response.statusCode == 200) {
        response.data.forEach((element) {
          products.add(ProductsModel.fromJson(element));
        });
      }
      log('Status code: ' + response.statusCode.toString());
      log('Test: ' + products.value[1].title!);
    } catch (e) {
      log(e.toString());
    }
    loading.value = false;
  }
}
