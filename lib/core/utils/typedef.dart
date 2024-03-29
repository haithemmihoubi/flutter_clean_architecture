
import 'package:flutter_clean_architecture/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
typedef ResultFuture<T> = Future<Either< Failure,T >  >;
typedef VoidResultFuture = Future<Either< Failure,void >  >;
// convert Map<String, dynamic> json to dataMap
typedef DataMap = Map<String, dynamic>;