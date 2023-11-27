class ProductsModel {
  String? id;
  String? title;
  String? price;
  String? description;
  String? category;
  String? image;

  ProductsModel({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.category,
    required this.description,
  });

  ProductsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    title = json['title'];
    price = json['price'].toString();
    description = json['description'];
    category = json['category'];
    image = json['image'];
  }
}
