// To parse this JSON data, do
//
//     final shopEntry = shopEntryFromJson(jsonString);

import 'dart:convert';

List<ShopEntry> shopEntryFromJson(String str) => List<ShopEntry>.from(json.decode(str).map((x) => ShopEntry.fromJson(x)));

String shopEntryToJson(List<ShopEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ShopEntry {
    String model;
    String pk;
    Fields fields;

    ShopEntry({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory ShopEntry.fromJson(Map<String, dynamic> json) => ShopEntry(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    int user;
    String name;
    int price;
    String description;
    int amount;

    Fields({
        required this.user,
        required this.name,
        required this.price,
        required this.description,
        required this.amount,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        amount: json["amount"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "price": price,
        "description": description,
        "amount": amount,
    };
}
