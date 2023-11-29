import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../controller/product_controller.dart';

class ProductList extends StatelessWidget {
  ProductList({super.key, required this.index});
  ProductController productsController = Get.put(ProductController());
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          width: Get.width / 4,
          child: Column(
            children: [
              Stack(
                children: [
                  CachedNetworkImage(
                      imageUrl: productsController.products[index].image!),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
