import 'package:flutter/material.dart';
import 'package:sample_project_with_bloc/app/di.dart';
import 'package:sample_project_with_bloc/presentation/forgot_password/forgot_password.dart';
import 'package:sample_project_with_bloc/presentation/login/login.dart';
import 'package:sample_project_with_bloc/presentation/main/main_view.dart';
import 'package:sample_project_with_bloc/presentation/onboarding/onboarding.dart';
import 'package:sample_project_with_bloc/presentation/register/register.dart';
import 'package:sample_project_with_bloc/presentation/resources/strings_manager.dart';
import 'package:sample_project_with_bloc/presentation/splash/splash.dart';
import 'package:sample_project_with_bloc/presentation/store_details/store_details.dart';

class Routes {

  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onBoarding";
  static const String loginRoute = "/login";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String registerRoute = "/register";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
}

class RoutesGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_)=> const SplashView());
      case Routes.loginRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (_)=> const LoginView());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_)=> const ForgotPasswordView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_)=> const MainView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_)=> const OnBoardingView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_)=> const RegisterView());
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (_)=> const StoreDetailsView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute(){
    return MaterialPageRoute(builder: (_)=>
         Scaffold(
          appBar: AppBar(
            title: const Text(AppStrings.noRouteFound),
          ),
           body: const Center(child: Text(AppStrings.noRouteFound),),
        ),
    );
  }
}