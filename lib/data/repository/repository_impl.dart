import 'package:dartz/dartz.dart';
import 'package:sample_project_with_bloc/data/data_source/remote_data_source.dart';
import 'package:sample_project_with_bloc/data/mapper/mapper.dart';
import 'package:sample_project_with_bloc/data/network/error_handler.dart';
import 'package:sample_project_with_bloc/data/network/failure.dart';
import 'package:sample_project_with_bloc/data/network/network_info.dart';
import 'package:sample_project_with_bloc/data/request/request.dart';
import 'package:sample_project_with_bloc/domain/model/model.dart';
import 'package:sample_project_with_bloc/domain/repository/repository.dart';

class RepositoryImpl extends Repository {
  RemoteDataSource _remoteDataSource;
  NetworkInfo _networkInfo;

  RepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.login(loginRequest);
        if (response.status == ApiInternalStatus.SUCCESS) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(response.status ?? ApiInternalStatus.FAILURE,
              response.message ?? ResponseMessage.DEFAULT));
        }
      } on Exception catch (e) {
        return (Left(ErrorHandler.handle(e).failure));
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
