import 'dart:ffi';
import 'dart:typed_data';

class SKU {
  final String size;
  final num price;
  final String product_id;
  final String stripe_price_id;
  final ByteBuffer imageData;

  final String? imageMimeType;

  SKU(this.size, this.price, this.product_id, this.stripe_price_id,
      this.imageData, this.imageMimeType);

  SKU.fromJson(Map<String, dynamic> json)
      : size = json["size"],
        price = json["price"],
        // price = json["price"] is int ? (json["price"] as int).toDouble(): json["price"],
        product_id = json["product_id"],
        stripe_price_id = json["stripe_price_id"],
        imageData =
            Uint8List.fromList(List<int>.from(json["imageData"]["data"]))
                .buffer,
        imageMimeType = json["imageMimeType"];
}
