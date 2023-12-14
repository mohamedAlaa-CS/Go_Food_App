import 'package:equatable/equatable.dart';

import 'datum.dart';

class PopularModel extends Equatable {
  final bool? success;
  final int? responseCode;
  final String? message;
  final List<Datum>? data;

  const PopularModel({
    this.success,
    this.responseCode,
    this.message,
    this.data,
  });

  factory PopularModel.fromJson(Map<String, dynamic> json) => PopularModel(
        success: json['success'] as bool?,
        responseCode: json['response_code'] as int?,
        message: json['message'] as String?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'response_code': responseCode,
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [success, responseCode, message, data];
}
