import 'package:dartz/dartz.dart';
import 'package:feirapp/src/core/errors/failure.dart';
import 'package:feirapp/src/core/usecase/usecase.dart';
import 'package:feirapp/src/domain/entities/product_data_entity.dart';
import 'package:feirapp/src/domain/repositories/product_repository.dart';

class GetProductsByIdsUsecase implements Usecase<ProductDataEntity, List<int>> {
  final ProductRepository repository;

  GetProductsByIdsUsecase({
    required this.repository,
  });

  @override
  Future<Either<Failure, ProductDataEntity>> call(List<int> params) async {
    return await repository.getProductsByIds(productIds: params);
  }
}
