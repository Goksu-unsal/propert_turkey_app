import 'dart:convert';

class Property {
  Property({
    this.tittle,
    this.price,
    this.type,
    this.overview,
    this.assetUrls,
  });

  String tittle;
  int price;
  String type;
  String overview;
  List<String> assetUrls;

  factory Property.fromJson(String str) => Property.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Property.fromMap(Map<String, dynamic> json) => Property(
    tittle: json["tittle"] == null ? null : json["tittle"],
    price: json["price"] == null ? null : json["price"],
    type: json["type"] == null ? null : json["type"],
    overview: json["overview"] == null ? null : json["overview"],
    assetUrls: json["asset-urls"] == null ? null : List<String>.from(json["asset-urls"].map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "tittle": tittle == null ? null : tittle,
    "price": price == null ? null : price,
    "type": type == null ? null : type,
    "overview": overview == null ? null : overview,
    "asset-urls": assetUrls == null ? null : List<dynamic>.from(assetUrls.map((x) => x)),
  };
}

