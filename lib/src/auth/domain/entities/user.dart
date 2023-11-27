import 'package:equatable/equatable.dart';

class User  extends Equatable  {
  const User({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.avatar,
  });

  final String avatar ;
  final String createdAt;
  final int id;
  final String name;

  @override
  List<Object?> get props =>  [id, createdAt, name, avatar];
}