import 'package:dartz/dartz.dart';
import 'package:feirapp/src/core/errors/exceptions.dart';
import 'package:feirapp/src/core/errors/failure.dart';
import 'package:feirapp/src/data/datasources/local_product_datasource.dart';
import 'package:feirapp/src/domain/repositories/local_product_repository.dart';

class LocalProductRepositoryImpl implements LocalProductRepository {
  final LocalProductDatasource datasource;

  LocalProductRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<Failure, List<String>>> getFavoriteProducts() async {
    try {
      return Right(
        await datasource.getFavoriteProducts(),
      );
    } on StorageException {
      return Left(StorageFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> saveProductToFavorites({
    required String productId,
  }) async {
    try {
      final bool result = await datasource.saveProductToFavorites(
        productId: productId,
      );

      return Right(result);
    } on StorageException {
      return Left(StorageFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> getIfProductIsFavorite({
    required String productId,
  }) async {
    try {
      final bool result = await datasource.getIfProductIsFavorite(
        productId: productId,
      );

      return Right(result);
    } on StorageException {
      return Left(StorageFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> removeProductToFavorites({
    required String productId,
  }) async {
    try {
      final bool result = await datasource.removeProductToFavorites(
        productId: productId,
      );

      return Right(result);
    } on StorageException {
      return Left(StorageFailure());
    }
  }
}
