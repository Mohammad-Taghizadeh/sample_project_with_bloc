import 'dart:async';

import 'package:sample_project_with_bloc/presentation/base/base_view_model.dart';
import 'package:sample_project_with_bloc/presentation/common/freezed_data_calss.dart';

class LoginViewModel extends BaseViewModel with LoginViewModelInput, LoginViewModelOutput{

  final StreamController _userNameStreamController = StreamController<String>.broadcast();
  final StreamController _passwordStreamController = StreamController<String>.broadcast();

  var loginObject = LoginObject("", "");

  @override
  void dispose() {
    _userNameStreamController.close();
    _passwordStreamController.close();
  }

  @override
  void start() {
  }

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputUserName => _userNameStreamController.sink;

  @override
  login() {
    throw UnimplementedError();
  }
  @override
  setPassword(String password) {
    inputPassword.add(password);
  }

  @override
  setUserName(String userName) {
    inputUserName.add(userName);
  }
  @override
  Stream<bool> get outputIsPasswordValid => _passwordStreamController.stream.map((password) => _isPasswordValid(password));

  @override
  Stream<bool> get outputIsUserNameValid => _userNameStreamController.stream.map((userName) => _isUserNameValid(userName))  ;

 bool _isUserNameValid(String userName){
   return userName.isNotEmpty;
 }

  bool _isPasswordValid(String password){
    return password.isNotEmpty;
  }

}

abstract class LoginViewModelInput {
  setUserName(String userName);
  setPassword(String password);

  login();

  Sink get inputUserName;
  Sink get inputPassword;
}

abstract class LoginViewModelOutput {
  Stream<bool> get outputIsUserNameValid;
  Stream<bool> get outputIsPasswordValid;
}