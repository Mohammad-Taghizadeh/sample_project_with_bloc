import 'package:dartz/dartz.dart';
import 'package:sample_project_with_bloc/data/data_source/remote_data_source.dart';
import 'package:sample_project_with_bloc/data/mapper/mapper.dart';
import 'package:sample_project_with_bloc/data/network/failure.dart';
import 'package:sample_project_with_bloc/data/network/network_info.dart';
import 'package:sample_project_with_bloc/data/request/request.dart';
import 'package:sample_project_with_bloc/domain/model.dart';
import 'package:sample_project_with_bloc/domain/repository.dart';

class RepositoryImpl extends Repository{

  RemoteDataSource _remoteDataSource;
  NetworkInfo _networkInfo;
  RepositoryImpl(this._remoteDataSource,this._networkInfo);
  @override
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest) async{
    if(await _networkInfo.isConnected){
      final response = await _remoteDataSource.login(loginRequest);
      if(response.status == 0){
      return Right(response.toDomain());
      }else{
        return Left(Failure(409,response.message ?? "we have error logic from api side"));
      }
    }else{
      return Left(Failure(501,"please check your internet connection"));
    }
  }
  
}