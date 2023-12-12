import 'package:equatable/equatable.dart';

import 'data_category_model.dart';

class HomeCategoryModel extends Equatable {
  final bool? success;
  final int? responseCode;
  final String? message;
  final Data? data;

  const HomeCategoryModel(
      {this.success, this.responseCode, this.message, this.data});

  factory HomeCategoryModel.fromJson(Map<String, dynamic> json) =>
      HomeCategoryModel(
        success: json['success'] as bool?,
        responseCode: json['response_code'] as int?,
        message: json['message'] as String?,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'response_code': responseCode,
        'message': message,
        'data': data?.toJson(),
      };

  @override
  List<Object?> get props => [success, responseCode, message, data];
}
