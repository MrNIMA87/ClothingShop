import 'package:clothing_shop/gen/assets.gen.dart';
import 'package:get/get.dart';

class ProductsModel {
  // String? id;
  String title;
  String price;
  String description;
  // String category;
  String image;
  String race;
  String category;
  List productDimensImages = [Assets.images.explore32.path];
  ProductsModel({
    // required this.id,
    this.title = '',
    this.price = '',
    this.image = '',
    //  this.category,
    this.description = '',
    this.race = '',
    this.category = '',
    required this.productDimensImages,
  });

  // ProductsModel.fromJson(Map<String, dynamic> json) {
  //   id = json['id'].toString();
  //   title = json['title'];
  //   price = json['price'].toString();
  //   description = json['description'];
  //   category = json['category'];
  //   image = json['image'];
  // }
}

List<ProductsModel> productList = [
  ProductsModel(
    title: 'Brown Jacket',
    price: '83.97',
    image: Assets.images.explore1.path,
    productDimensImages: [Assets.images.explore1.path],
    description:
        '''Wearing a single coat makes you look neat and stylish. Simple jackets can make your everyday outfit look a little more formal and masculine. Simple designs and one color is one of the most common designs that men choose for their jackets. These jackets have their own fans and are available in different colors. Using a coat as a part of style can have a great impact on men\'s appearance. We have tried to provide all our products with high quality by using the best materials. The fabric of this coat is made of a combination of wool and polyester, which is very durable and resistant. This jacket closes with a button in the front''',
    race: '4.8',
    category: 'All',
  ),
  ProductsModel(
    title: 'Brown Jacket',
    price: '36.97',
    image: Assets.images.explore21.path,
    productDimensImages: [
      Assets.images.explore21.path,
      Assets.images.explore22.path,
    ],
    description:
        '''Wearing a single coat makes you look neat and stylish. Simple jackets can make your everyday outfit look a little more formal and masculine. Simple designs and one color is one of the most common designs that men choose for their jackets. These jackets have their own fans and are available in different colors. Using a coat as a part of style can have a great impact on men\'s appearance. We have tried to provide all our products with high quality by using the best materials. The fabric of this coat is made of a combination of wool and polyester, which is very durable and resistant. This jacket closes with a button in the front''',
    race: '4.8',
    category: '',
  ),
  ProductsModel(
    title: 'Brown Jacket',
    price: '64.97',
    image: Assets.images.explore22.path,
    productDimensImages: [
      Assets.images.explore31.path,
      Assets.images.explore32.path,
      Assets.images.explore33.path,
      Assets.images.explore34.path,
    ],
    description:
        '''Wearing a single coat makes you look neat and stylish. Simple jackets can make your everyday outfit look a little more formal and masculine. Simple designs and one color is one of the most common designs that men choose for their jackets. These jackets have their own fans and are available in different colors. Using a coat as a part of style can have a great impact on men\'s appearance. We have tried to provide all our products with high quality by using the best materials. The fabric of this coat is made of a combination of wool and polyester, which is very durable and resistant. This jacket closes with a button in the front''',
    race: '4.8',
    category: '',
  ),
  ProductsModel(
    title: 'Brown Jacket',
    price: '77.97',
    image: Assets.images.explore31.path,
    productDimensImages: [
      Assets.images.explore41.path,
      Assets.images.explore42.path,
      Assets.images.explore1.path,
    ],
    description:
        '''Wearing a single coat makes you look neat and stylish. Simple jackets can make your everyday outfit look a little more formal and masculine. Simple designs and one color is one of the most common designs that men choose for their jackets. These jackets have their own fans and are available in different colors. Using a coat as a part of style can have a great impact on men\'s appearance. We have tried to provide all our products with high quality by using the best materials. The fabric of this coat is made of a combination of wool and polyester, which is very durable and resistant. This jacket closes with a button in the front''',
    race: '4.8',
    category: '',
  ),
  ProductsModel(
    title: 'Brown Jacket',
    price: '23.97',
    image: Assets.images.explore32.path,
    productDimensImages: [Assets.images.explore5.path],
    description:
        '''Wearing a single coat makes you look neat and stylish. Simple jackets can make your everyday outfit look a little more formal and masculine. Simple designs and one color is one of the most common designs that men choose for their jackets. These jackets have their own fans and are available in different colors. Using a coat as a part of style can have a great impact on men\'s appearance. We have tried to provide all our products with high quality by using the best materials. The fabric of this coat is made of a combination of wool and polyester, which is very durable and resistant. This jacket closes with a button in the front''',
    race: '4.8',
    category: '',
  ),
  ProductsModel(
    title: 'Brown Jacket',
    price: '46.97',
    image: Assets.images.explore33.path,
    productDimensImages: [
      Assets.images.explore21.path,
      Assets.images.explore22.path,
    ],
    description:
        '''Wearing a single coat makes you look neat and stylish. Simple jackets can make your everyday outfit look a little more formal and masculine. Simple designs and one color is one of the most common designs that men choose for their jackets. These jackets have their own fans and are available in different colors. Using a coat as a part of style can have a great impact on men\'s appearance. We have tried to provide all our products with high quality by using the best materials. The fabric of this coat is made of a combination of wool and polyester, which is very durable and resistant. This jacket closes with a button in the front''',
    race: '4.8',
    category: '',
  ),
  ProductsModel(
    title: 'Brown Jacket',
    price: '14.97',
    image: Assets.images.explore34.path,
    productDimensImages: [
      Assets.images.explore31.path,
      Assets.images.explore34.path,
    ],
    description:
        '''Wearing a single coat makes you look neat and stylish. Simple jackets can make your everyday outfit look a little more formal and masculine. Simple designs and one color is one of the most common designs that men choose for their jackets. These jackets have their own fans and are available in different colors. Using a coat as a part of style can have a great impact on men\'s appearance. We have tried to provide all our products with high quality by using the best materials. The fabric of this coat is made of a combination of wool and polyester, which is very durable and resistant. This jacket closes with a button in the front''',
    race: '4.8',
    category: '',
  ),
  ProductsModel(
    title: 'Brown Jacket',
    price: '99.97',
    image: Assets.images.explore41.path,
    productDimensImages: [
      Assets.images.explore32.path,
      Assets.images.explore33.path,
    ],
    description:
        '''Wearing a single coat makes you look neat and stylish. Simple jackets can make your everyday outfit look a little more formal and masculine. Simple designs and one color is one of the most common designs that men choose for their jackets. These jackets have their own fans and are available in different colors. Using a coat as a part of style can have a great impact on men\'s appearance. We have tried to provide all our products with high quality by using the best materials. The fabric of this coat is made of a combination of wool and polyester, which is very durable and resistant. This jacket closes with a button in the front''',
    race: '4.8',
    category: '',
  ),
  ProductsModel(
    title: 'Brown Jacket',
    price: '52.97',
    image: Assets.images.explore42.path,
    productDimensImages: [
      Assets.images.explore22.path,
      Assets.images.explore5.path,
      Assets.images.explore42.path,
    ],
    description:
        '''Wearing a single coat makes you look neat and stylish. Simple jackets can make your everyday outfit look a little more formal and masculine. Simple designs and one color is one of the most common designs that men choose for their jackets. These jackets have their own fans and are available in different colors. Using a coat as a part of style can have a great impact on men\'s appearance. We have tried to provide all our products with high quality by using the best materials. The fabric of this coat is made of a combination of wool and polyester, which is very durable and resistant. This jacket closes with a button in the front''',
    race: '4.8',
    category: '',
  ),
  ProductsModel(
    title: 'Brown Jacket',
    price: '119.97',
    image: Assets.images.explore5.path,
    productDimensImages: [
      Assets.images.explore1.path,
      Assets.images.explore22.path,
      Assets.images.explore32.path,
      Assets.images.explore32.path,
    ],
    description:
        '''Wearing a single coat makes you look neat and stylish. Simple jackets can make your everyday outfit look a little more formal and masculine. Simple designs and one color is one of the most common designs that men choose for their jackets. These jackets have their own fans and are available in different colors. Using a coat as a part of style can have a great impact on men\'s appearance. We have tried to provide all our products with high quality by using the best materials. The fabric of this coat is made of a combination of wool and polyester, which is very durable and resistant. This jacket closes with a button in the front''',
    race: '4.8',
    category: '',
  ),
];
