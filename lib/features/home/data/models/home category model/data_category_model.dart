import 'package:equatable/equatable.dart';

import 'datum_category_model.dart';

class Data extends Equatable {
  final List<CategoryData>? data;
  final int? cartCount;

  const Data({this.data, this.cartCount});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => CategoryData.fromJson(e as Map<String, dynamic>))
            .toList(),
        cartCount: json['cart_count'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'data': data?.map((e) => e.toJson()).toList(),
        'cart_count': cartCount,
      };

  @override
  List<Object?> get props => [data, cartCount];
}
