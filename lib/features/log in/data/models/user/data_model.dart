import 'package:equatable/equatable.dart';

import 'address_model.dart';

class Data extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? image;
  final int? type;
  final int? status;
  final String? balance;
  final List<Address>? addresses;
  final String? token;

  const Data({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.image,
    this.type,
    this.status,
    this.balance,
    this.addresses,
    this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['id'] as int?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        phone: json['phone'] as String?,
        image: json['image'] as String?,
        type: json['type'] as int?,
        status: json['status'] as int?,
        balance: json['balance'] as String?,
        addresses: (json['addresses'] as List<dynamic>?)
            ?.map((e) => Address.fromJson(e as Map<String, dynamic>))
            .toList(),
        token: json['token'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'phone': phone,
        'image': image,
        'type': type,
        'status': status,
        'balance': balance,
        'addresses': addresses?.map((e) => e.toJson()).toList(),
        'token': token,
      };

  @override
  List<Object?> get props {
    return [
      id,
      name,
      email,
      phone,
      image,
      type,
      status,
      balance,
      addresses,
      token,
    ];
  }
}
