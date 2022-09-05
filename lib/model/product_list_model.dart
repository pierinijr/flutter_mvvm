// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    this.siteId,
    this.query,
    this.paging,
    this.results,
  });

  String? siteId;
  String? query;
  Paging? paging;
  List<Result>? results;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        siteId: json["site_id"],
        query: json["query"],
        paging: Paging.fromJson(json["paging"]),
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "site_id": siteId,
        "query": query,
        "paging": paging!.toJson(),
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class Paging {
  Paging({
    this.total,
    this.primaryResults,
    this.offset,
    this.limit,
  });

  int? total;
  int? primaryResults;
  int? offset;
  int? limit;

  factory Paging.fromJson(Map<String, dynamic> json) => Paging(
        total: json["total"],
        primaryResults: json["primary_results"],
        offset: json["offset"],
        limit: json["limit"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "primary_results": primaryResults,
        "offset": offset,
        "limit": limit,
      };
}

class Result {
  Result({
    this.id,
    this.siteId,
    this.title,
    this.seller,
    this.price,
    this.currencyId,
    this.availableQuantity,
    this.soldQuantity,
    this.condition,
    this.permalink,
    this.thumbnail,
    this.thumbnailId,
    this.address,
    this.shipping,
    this.originalPrice,
    this.domainId,
    this.catalogProductId,
  });

  String? id;
  String? siteId;
  String? title;
  Seller? seller;
  int? price;
  String? currencyId;
  int? availableQuantity;
  int? soldQuantity;
  String? condition;
  String? permalink;
  String? thumbnail;
  String? thumbnailId;
  Address? address;
  Shipping? shipping;
  int? originalPrice;
  String? domainId;
  String? catalogProductId;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        siteId: json["site_id"],
        title: json["title"],
        seller: Seller.fromJson(json["seller"]),
        price: json["price"],
        currencyId: json["currency_id"],
        availableQuantity: json["available_quantity"],
        soldQuantity: json["sold_quantity"],
        condition: json["condition"],
        permalink: json["permalink"],
        thumbnail: json["thumbnail"],
        thumbnailId: json["thumbnail_id"],
        address: Address.fromJson(json["address"]),
        shipping: Shipping.fromJson(json["shipping"]),
        originalPrice: json["original_price"],
        domainId: json["domain_id"],
        catalogProductId: json["catalog_product_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "site_id": siteId,
        "title": title,
        "seller": seller!.toJson(),
        "price": price,
        "currency_id": currencyId,
        "available_quantity": availableQuantity,
        "sold_quantity": soldQuantity,
        "condition": condition,
        "permalink": permalink,
        "thumbnail": thumbnail,
        "thumbnail_id": thumbnailId,
        "address": address!.toJson(),
        "shipping": shipping!.toJson(),
        "original_price": originalPrice,
        "domain_id": domainId,
        "catalog_product_id": catalogProductId,
      };
}

class Address {
  Address({
    this.stateId,
    this.stateName,
    this.cityId,
    this.cityName,
  });

  String? stateId;
  String? stateName;
  String? cityId;
  String? cityName;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        stateId: json["state_id"],
        stateName: json["state_name"],
        cityId: json["city_id"],
        cityName: json["city_name"],
      );

  Map<String, dynamic> toJson() => {
        "state_id": stateId,
        "state_name": stateName,
        "city_id": cityId,
        "city_name": cityName,
      };
}

class Seller {
  Seller({
    this.id,
    this.permalink,
  });

  int? id;
  String? permalink;

  factory Seller.fromJson(Map<String, dynamic> json) => Seller(
        id: json["id"],
        permalink: json["permalink"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "permalink": permalink,
      };
}

class Shipping {
  Shipping({
    this.freeShipping,
    this.mode,
    this.tags,
    this.logisticType,
    this.storePickUp,
  });

  bool? freeShipping;
  String? mode;
  List<String>? tags;
  String? logisticType;
  bool? storePickUp;

  factory Shipping.fromJson(Map<String, dynamic> json) => Shipping(
        freeShipping: json["free_shipping"],
        mode: json["mode"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        logisticType: json["logistic_type"],
        storePickUp: json["store_pick_up"],
      );

  Map<String, dynamic> toJson() => {
        "free_shipping": freeShipping,
        "mode": mode,
        "tags": List<dynamic>.from(tags!.map((x) => x)),
        "logistic_type": logisticType,
        "store_pick_up": storePickUp,
      };
}
