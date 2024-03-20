import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:isp_wallet/api/cache.dart';
import 'package:isp_wallet/routers/routes.dart';
import 'package:isp_wallet/utils/bloc_base.dart';

class SplashBloc extends BlocBaseWithState<ScreenState> {
  @override
  ScreenState get currentState => super.currentState!;

  final Cache cache = Cache();

  SplashBloc() {
    setState(ScreenState());
  }

  void init(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 4));
      if (context.mounted) context.router.replace(const StartInfoRoute());

  }
}

class ScreenState {
  final bool loading;

  ScreenState({this.loading = false});

  ScreenState copyWith({bool? loading}) {
    return ScreenState(loading: loading ?? this.loading);
  }
}
