import 'package:equatable/equatable.dart';

import 'category.dart';
import 'information.dart';
import 'product_category.dart';

class PopularData extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? image;
  final String? logo;
  final String? description;
  final String? distance;
  final int? type;
  final int? status;
  final String? lat;
  final String? lng;
  final String? address;
  final String? appointments;
  final int? trending;
  final int? popular;
  final String? rate;
  final bool? isFavorite;
  final List<Category>? categories;
  final String? token;
  final Information? information;
  final List<ProductCategory>? productCategories;

  const PopularData({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.image,
    this.logo,
    this.description,
    this.distance,
    this.type,
    this.status,
    this.lat,
    this.lng,
    this.address,
    this.appointments,
    this.trending,
    this.popular,
    this.rate,
    this.isFavorite,
    this.categories,
    this.token,
    this.information,
    this.productCategories,
  });

  factory PopularData.fromJson(Map<String, dynamic> json) => PopularData(
        id: json['id'] as int?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        phone: json['phone'] as String?,
        image: json['image'] as String?,
        logo: json['logo'] as String?,
        description: json['description'] as String?,
        distance: json['distance'] as String?,
        type: json['type'] as int?,
        status: json['status'] as int?,
        lat: json['lat'] as String?,
        lng: json['lng'] as String?,
        address: json['address'] as String?,
        appointments: json['appointments'] as String?,
        trending: json['trending'] as int?,
        popular: json['popular'] as int?,
        rate: json['rate'] as String?,
        isFavorite: json['is_favorite'] as bool?,
        categories: (json['categories'] as List<dynamic>?)
            ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
            .toList(),
        token: json['token'] as String?,
        information: json['information'] == null
            ? null
            : Information.fromJson(json['information'] as Map<String, dynamic>),
        productCategories: (json['product_categories'] as List<dynamic>?)
            ?.map((e) => ProductCategory.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'phone': phone,
        'image': image,
        'logo': logo,
        'description': description,
        'distance': distance,
        'type': type,
        'status': status,
        'lat': lat,
        'lng': lng,
        'address': address,
        'appointments': appointments,
        'trending': trending,
        'popular': popular,
        'rate': rate,
        'is_favorite': isFavorite,
        'categories': categories?.map((e) => e.toJson()).toList(),
        'token': token,
        'information': information?.toJson(),
        'product_categories':
            productCategories?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      name,
      email,
      phone,
      image,
      logo,
      description,
      distance,
      type,
      status,
      lat,
      lng,
      address,
      appointments,
      trending,
      popular,
      rate,
      isFavorite,
      categories,
      token,
      information,
      productCategories,
    ];
  }
}
