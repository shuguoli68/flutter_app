import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app/redux/action/action_login.dart';
import 'package:flutter_app/redux/state/state_login.dart';


Reducer<LoginState> buildReducer() {
  return asReducer(
    <Object, Reducer<LoginState>>{
      LoginAction.clearUsername: _clearUsername,
      LoginAction.clearPassword: _clearPasswrod,
    },
  );
}

LoginState _clearUsername(LoginState state, Action action) {
  final LoginState newState = state.clone();
  newState.usernameController.clear(); //在这里设置username输入框为空
  return newState;
}

LoginState _clearPasswrod(LoginState state, Action action) {
  final LoginState newState = state.clone();
  newState.passwordController.clear(); //在这里设置清空password输入框为空
  return newState;
}