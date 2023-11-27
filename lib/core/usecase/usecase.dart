import 'package:flutter_clean_architecture/core/utils/typedef.dart';


abstract class UsecaseWithParams<Type, Params> {
  const  UsecaseWithParams();
 ResultFuture<Type> call(Params params);
}
abstract class UseCaseNoParams<Type> {
  const UseCaseNoParams();
 ResultFuture<Type> call();
}