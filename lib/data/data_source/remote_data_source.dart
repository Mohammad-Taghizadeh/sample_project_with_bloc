import 'package:sample_project_with_bloc/data/request/request.dart';
import 'package:sample_project_with_bloc/data/responses/responses.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);
}