import 'package:dartz/dartz.dart';
import 'package:feirapp/src/core/errors/failure.dart';
import 'package:feirapp/src/core/usecase/usecase.dart';
import 'package:feirapp/src/domain/entities/products_and_pagination_entity.dart';
import 'package:feirapp/src/domain/params/product_filter_param.dart';

import 'package:feirapp/src/domain/repositories/product_repository.dart';

class GetProductsUsecase
    implements Usecase<ProductsAndPaginationEntity, ProductsFilterParam> {
  final ProductRepository repository;

  GetProductsUsecase({required this.repository});

  @override
  Future<Either<Failure, ProductsAndPaginationEntity>> call(
    ProductsFilterParam params,
  ) async {
    return await repository.getProducts(params: params);
  }
}
