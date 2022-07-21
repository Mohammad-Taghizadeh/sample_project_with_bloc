import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:sample_project_with_bloc/app/app_pref.dart';
import 'package:sample_project_with_bloc/app/constant.dart';
import 'package:sample_project_with_bloc/domain/model/model.dart';

// ignore: constant_identifier_names
const String APPLICATION_JSON = "application/json";
// ignore: constant_identifier_names
const String CONTENT_TYPE = "content-type";
// ignore: constant_identifier_names
const String ACCEPT = "accept";
// ignore: constant_identifier_names
const String AUTHORIZATION = "authorization";
// ignore: constant_identifier_names
const String DEFAULT_LANGUAGES = "languages";

class DioFactory {
  AppPreferences _appPreferences;
  DioFactory(this._appPreferences);
    Future<Dio>  getDio()async{

      int _timeOut = 60 * 1000;
      Dio dio = Dio();
      String language = await _appPreferences.getAppLanguage();
      Map<String,String> headers = {
        CONTENT_TYPE : APPLICATION_JSON,
        ACCEPT: APPLICATION_JSON,
        AUTHORIZATION: Constant.token,
        DEFAULT_LANGUAGES: language
      };

      dio.options = BaseOptions(
        headers: headers,
        connectTimeout: _timeOut,
        receiveTimeout: _timeOut,
        baseUrl: Constant.baseUrl,
      );

      if(kDebugMode){
        dio.interceptors.add(PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          responseBody: true,
        ));
      }
      return dio;
    }
}