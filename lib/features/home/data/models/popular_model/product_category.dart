import 'package:equatable/equatable.dart';

class ProductCategory extends Equatable {
  final int? id;
  final String? name;
  final int? active;
  final String? nameAr;
  final String? nameEn;

  const ProductCategory({
    this.id,
    this.name,
    this.active,
    this.nameAr,
    this.nameEn,
  });

  factory ProductCategory.fromJson(Map<String, dynamic> json) {
    return ProductCategory(
      id: json['id'] as int?,
      name: json['name'] as String?,
      active: json['active'] as int?,
      nameAr: json['name_ar'] as String?,
      nameEn: json['name_en'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'active': active,
        'name_ar': nameAr,
        'name_en': nameEn,
      };

  @override
  List<Object?> get props => [id, name, active, nameAr, nameEn];
}
