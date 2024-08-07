import 'dart:convert';

import 'package:feirapp/src/domain/entities/logout_entity.dart';

class LogoutModel extends LogoutEntity {
  LogoutModel({
    required super.data,
    required super.message,
  });

  factory LogoutModel.fromMap(Map<String, dynamic> map) {
    return LogoutModel(
      data: map['data'],
      message: map['message'],
    );
  }

  factory LogoutModel.fromEntity(LogoutEntity entity) {
    return LogoutModel(
      data: entity.data,
      message: entity.message,
    );
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = {};

    map['data'] = data;
    map['message'] = message;

    return map;
  }

  LogoutEntity toEntity() {
    return LogoutEntity(
      message: message,
    );
  }

  String toJson() {
    return jsonEncode(toMap());
  }
}
