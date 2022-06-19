import 'package:dio/dio.dart';

class DioFactory {
    Future<Dio>  getDio()async{
      Dio dio = Dio();
      Map<String,String> headers = {

      };
      return dio;
    }
}