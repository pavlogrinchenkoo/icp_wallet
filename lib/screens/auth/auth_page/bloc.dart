import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:isp_wallet/routers/routes.dart';
import 'package:isp_wallet/utils/bloc_base.dart';

class AuthBloc extends BlocBaseWithState<ScreenState> {
  @override
  ScreenState get currentState => super.currentState!;

  AuthBloc() {
    setState(ScreenState());
  }

  void goToLogin(BuildContext context) async {
    context.router.push(const LoginRoute());
  }
}

class ScreenState {
  final bool loading;

  ScreenState({this.loading = false});

  ScreenState copyWith({bool? loading}) {
    return ScreenState(loading: loading ?? this.loading);
  }
}
