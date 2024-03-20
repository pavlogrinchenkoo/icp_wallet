import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:isp_wallet/routers/routes.dart';
import 'package:isp_wallet/utils/bloc_base.dart';

class StartInfoBloc extends BlocBaseWithState<ScreenState> {
  @override
  ScreenState get currentState => super.currentState!;

  StartInfoBloc() {
    setState(ScreenState());
  }

  void goToInfo(BuildContext context) async {
    context.router.push(const InfoRoute());
  }
}

class ScreenState {
  final bool loading;

  ScreenState({this.loading = false});

  ScreenState copyWith({bool? loading}) {
    return ScreenState(loading: loading ?? this.loading);
  }
}
