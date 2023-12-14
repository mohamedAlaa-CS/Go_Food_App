import 'package:equatable/equatable.dart';

class CategoryData extends Equatable {
  final int? id;
  final String? name;
  final String? image;
  final int? active;
  final String? nameAr;
  final String? nameEn;

  const CategoryData({
    this.id,
    this.name,
    this.image,
    this.active,
    this.nameAr,
    this.nameEn,
  });

  factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
        id: json['id'] as int?,
        name: json['name'] as String?,
        image: json['image'] as String?,
        active: json['active'] as int?,
        nameAr: json['name_ar'] as String?,
        nameEn: json['name_en'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'active': active,
        'name_ar': nameAr,
        'name_en': nameEn,
      };

  @override
  List<Object?> get props => [id, name, image, active, nameAr, nameEn];
}
