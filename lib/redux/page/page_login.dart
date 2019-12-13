import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app/redux/effect/effect_login.dart';
import 'package:flutter_app/redux/reducer/reducer_login.dart';
import 'package:flutter_app/redux/state/state_login.dart';
import 'package:flutter_app/redux/view/view_login.dart';



class LoginPage extends Page<LoginState, Map<String, dynamic>> {
  LoginPage()
      : super(
    initState: initState,
    effect: buildEffect(),
    reducer: buildReducer(),
    view: buildView,
  );
}