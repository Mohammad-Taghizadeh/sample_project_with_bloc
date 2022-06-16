import 'package:dartz/dartz.dart';
import 'package:sample_project_with_bloc/data/responses/responses.dart';
import 'package:sample_project_with_bloc/domain/model.dart';

import '../data/network/failure.dart';
import '../data/request/request.dart';

abstract class Repository{
  Future<Either<Failure,Authentication>> login(LoginRequest loginRequest);
}