class ProductModel {
  final String name;
  final String description;
  final double price;

  ProductModel(this.name, this.description, this.price);

  factory ProductModel.fromJson(Map<String, dynamic> data) =>
      ProductModel(data['name'], data['description'], data['price']);

  @override
  String toString() {
    return 'ProductModel( name: $name, description: $description, price: $price )';
  }
}
