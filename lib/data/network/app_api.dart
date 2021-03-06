
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:sample_project_with_bloc/app/constant.dart';
import 'package:sample_project_with_bloc/data/responses/responses.dart';
part 'app_api.g.dart';

// flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs

@RestApi(baseUrl: Constant.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio,{String baseUrl}) = _AppServiceClient;

  @POST("/customers/login")
  Future<AuthenticationResponse> login(
      @Field("email") String email,
      @Field("password") String password,
      @Field("imei") String imei,
      @Field("deviceType") String deviceType,
      );
}