import 'dart:async';

import 'package:sample_project_with_bloc/domain/usecase/login_usecase.dart';
import 'package:sample_project_with_bloc/presentation/base/base_view_model.dart';
import 'package:sample_project_with_bloc/presentation/common/freezed_data_calss.dart';

class LoginViewModel extends BaseViewModel
    with LoginViewModelInput, LoginViewModelOutput {
  final StreamController _userNameStreamController =
      StreamController<String>.broadcast();
  final StreamController _passwordStreamController = StreamController<String>.broadcast();
  final StreamController _isAllInputStreamController = StreamController<void>.broadcast();

  var loginObject = LoginObject("", "");

  LoginUseCase _loginUseCase;

  LoginViewModel(this._loginUseCase);

  @override
  void dispose() {
    _userNameStreamController.close();
    _passwordStreamController.close();
  }

  @override
  void start() {}

  // inputs

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputUserName => _userNameStreamController.sink;

  @override
  Sink get inputIsAllInputValid => _isAllInputStreamController.sink;

  @override
  login() async {
    (await _loginUseCase.execute(
            LoginUseCaseInput(loginObject.userName, loginObject.password)))
        .fold((failure) => {print(failure.message)},
            (data) => {print(data.customer?.name)});
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    loginObject = loginObject.copyWith(password: password);
    _validate();
  }

  @override
  setUserName(String userName) {
    inputUserName.add(userName);
    loginObject = loginObject.copyWith(userName: userName);
    _validate();
  }

  // outputs

  @override
  Stream<bool> get outputIsPasswordValid => _passwordStreamController.stream
      .map((password) => _isPasswordValid(password));

  @override
  Stream<bool> get outputIsUserNameValid => _userNameStreamController.stream
      .map((userName) => _isUserNameValid(userName));

  @override
  Stream<bool> get outputIsAllInputValid => _isAllInputStreamController.stream.map((_) => _isAllInputsValid());


  // function

  _validate(){
    inputIsAllInputValid.add(null);
  }
  bool _isUserNameValid(String userName) {
    return userName.isNotEmpty;
  }

  bool _isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  bool _isAllInputsValid (){
    return _isUserNameValid(loginObject.userName) && _isPasswordValid(loginObject.password);
  }




}

abstract class LoginViewModelInput {
  setUserName(String userName);

  setPassword(String password);

  login();

  Sink get inputUserName;

  Sink get inputPassword;
  Sink get inputIsAllInputValid;
}

abstract class LoginViewModelOutput {
  Stream<bool> get outputIsUserNameValid;

  Stream<bool> get outputIsPasswordValid;
  Stream<bool> get outputIsAllInputValid;
}
