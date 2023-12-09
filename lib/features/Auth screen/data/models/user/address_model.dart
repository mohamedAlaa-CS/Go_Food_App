import 'package:equatable/equatable.dart';

class Address extends Equatable {
  final int? id;
  final String? lat;
  final String? lng;
  final dynamic address;
  final String? street;
  final String? building;
  final String? apartment;
  final dynamic floor;
  final dynamic name;

  const Address({
    this.id,
    this.lat,
    this.lng,
    this.address,
    this.street,
    this.building,
    this.apartment,
    this.floor,
    this.name,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json['id'] as int?,
        lat: json['lat'] as String?,
        lng: json['lng'] as String?,
        address: json['address'] as dynamic,
        street: json['street'] as String?,
        building: json['building'] as String?,
        apartment: json['apartment'] as String?,
        floor: json['floor'] as dynamic,
        name: json['name'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'lat': lat,
        'lng': lng,
        'address': address,
        'street': street,
        'building': building,
        'apartment': apartment,
        'floor': floor,
        'name': name,
      };

  @override
  List<Object?> get props {
    return [
      id,
      lat,
      lng,
      address,
      street,
      building,
      apartment,
      floor,
      name,
    ];
  }
}
