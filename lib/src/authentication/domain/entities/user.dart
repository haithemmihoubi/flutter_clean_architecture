import 'package:equatable/equatable.dart';

class User  extends Equatable  {
  const User({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.avatar,
  });
// empty constructor
  const User.empty() : this(id: '0', createdAt: '', name: '', avatar: '');

  final String avatar ;
  final String createdAt;
  final String id;
  final String name;

  @override
  List<Object?> get props =>  [id, createdAt, name, avatar];





}