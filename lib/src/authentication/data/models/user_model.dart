import 'dart:convert';

import 'package:flutter_clean_architecture/core/utils/typedef.dart';
import 'package:flutter_clean_architecture/src/authentication/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id ,
    required  super.avatar ,
    required  super.createdAt ,
    required  super.name ,
  })  ;

// fromJson
    UserModel.fromMap(DataMap map) : this(
    id: map['id'] as String,
    avatar: map['avatar'] as String,
      createdAt: map['createdAt'] as String,
      name: map['name'] as String,
    ) ;
// factory
factory UserModel .fromJson(DataMap map) => UserModel.fromMap( jsonDecode( jsonEncode(map) ) );
// Tojson
DataMap toMap() => {
    'id': id,
    'avatar': avatar,
    'createdAt': createdAt,
    'name': name,
  };
// empty constructor
  const UserModel.empty() : this(id: '0', avatar: '', createdAt: '', name: '');

String toJson() =>  jsonEncode( toMap );
// copyWith method to copy the object
  // is used to copy the object and update it
  //   with new values without changing the original object
UserModel copyWith({
    String? id,
    String? avatar,
    String? createdAt,
    String? name,
  }) =>
      UserModel(
        id: id ?? this.id,
        avatar: avatar ?? this.avatar,
        createdAt: createdAt ?? this.createdAt,
        name: name ?? this.name,
      );

  @override
  List<Object?> get props => [id, avatar, createdAt, name];
}
