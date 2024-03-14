import 'package:mobile/modules/store/data/models/sku.dart';

class Product {
  final String name;
  final String description;
  final String? stripe_product_id;
  // final String? image_url;
  final List<dynamic> skuid;
  final String? metadata;
  final List<SKU> skus;

  Product(this.name, this.description, this.stripe_product_id, this.skuid,
      this.metadata, this.skus);
  Product.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        description = json["description"],
        stripe_product_id = json["stripe_product_id"],
        skuid = json["SKUid"],
        metadata = json["metadata"],
        skus =
            List<SKU>.from((json["SKUS"]).map((e) => SKU.fromJson(e)).toList());
}
