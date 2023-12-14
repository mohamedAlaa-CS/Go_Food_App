import 'package:equatable/equatable.dart';

import 'datum.dart';

class TrendingModel extends Equatable {
  final bool? success;
  final int? responseCode;
  final String? message;
  final List<TrendingDataModel>? data;

  const TrendingModel({
    this.success,
    this.responseCode,
    this.message,
    this.data,
  });

  factory TrendingModel.fromJson(Map<String, dynamic> json) => TrendingModel(
        success: json['success'] as bool?,
        responseCode: json['response_code'] as int?,
        message: json['message'] as String?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => TrendingDataModel.fromJson(e as Map<String, dynamic>))
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
