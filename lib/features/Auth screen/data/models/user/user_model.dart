import 'package:equatable/equatable.dart';

import 'data_model.dart';

class UserModel extends Equatable {
  final bool? success;
  final int? responseCode;
  final String? message;
  final Data? data;

  const UserModel({this.success, this.responseCode, this.message, this.data});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
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
