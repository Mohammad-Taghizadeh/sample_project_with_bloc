
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:sample_project_with_bloc/app/app_pref.dart';
import 'package:sample_project_with_bloc/data/data_source/remote_data_source.dart';
import 'package:sample_project_with_bloc/data/network/app_api.dart';
import 'package:sample_project_with_bloc/data/network/dio_factory.dart';
import 'package:sample_project_with_bloc/data/network/network_info.dart';
import 'package:sample_project_with_bloc/data/repository/repository_impl.dart';
import 'package:sample_project_with_bloc/domain/repository/repository.dart';
import 'package:sample_project_with_bloc/domain/usecase/login_usecase.dart';
import 'package:sample_project_with_bloc/presentation/login/login_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

Future<void> initAppModule()async{

  final sharedPreferences= await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  instance.registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

  instance.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(DataConnectionChecker()));

  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  final dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  instance.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImplementer(instance()));

  instance.registerLazySingleton<Repository>(() => RepositoryImpl(instance(), instance()));

}

initLoginModule(){
  if(!GetIt.I.isRegistered<LoginUseCase>()){
    instance.registerLazySingleton<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerLazySingleton<LoginViewModel>(() => LoginViewModel(instance()));
  }
}