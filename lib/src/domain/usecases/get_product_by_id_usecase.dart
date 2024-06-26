import 'package:dartz/dartz.dart';
import 'package:feirapp/src/core/errors/failure.dart';
import 'package:feirapp/src/core/usecase/usecase.dart';
import 'package:feirapp/src/domain/entities/product_data_entity.dart';
import 'package:feirapp/src/domain/repositories/product_repository.dart';

class GetProductByIdUsecase implements Usecase<ProductDataEntity, String> {
  final ProductRepository repository;

  GetProductByIdUsecase({
    required this.repository,
  });

  @override
  Future<Either<Failure, ProductDataEntity>> call(String id) async {
    return await repository.getProductById(id: id);
  }
}
