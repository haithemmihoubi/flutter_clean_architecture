
import 'package:flutter_clean_architecture/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
typedef ResultFuture<T> = Future<Either< Failure,T >  >;