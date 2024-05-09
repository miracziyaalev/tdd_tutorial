import 'dart:convert';

import 'package:tdd_tutorial/core/utils/typedef.dart';
import 'package:tdd_tutorial/src/authentication/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.createdAt,
    required super.name,
    required super.avatar,
  });

  const UserModel.empty()
      : this(
          id: "1",
          avatar: "_empty.avatar",
          createdAt: "_empty.createdAt",
          name: "_empty.name",
        );

  factory UserModel.fromJson(String source) => UserModel.fromMap(jsonDecode(source) as DataMap);

  UserModel.fromMap(DataMap map)
      : this(
          avatar: map['avatar'] as String,
          createdAt: map['createdAt'] as String,
          id: map['id'] as String,
          name: map['name'] as String,
        );

  UserModel copyWith({
    String? avatar,
    String? createdAt,
    String? id,
    String? name,
  }) {
    return UserModel(
      avatar: avatar ?? this.avatar,
      createdAt: createdAt ?? this.createdAt,
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  DataMap toMap() => {
        "id": id,
        "avatar": avatar,
        "createdAt": createdAt,
        "name": name,
      };

  String toJson() => jsonEncode(toMap());
}
