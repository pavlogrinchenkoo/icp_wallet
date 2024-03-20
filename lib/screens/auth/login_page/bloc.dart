import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:isp_wallet/api/cache.dart';
import 'package:isp_wallet/routers/routes.dart';
import 'package:isp_wallet/utils/bloc_base.dart';

class LoginBloc extends BlocBaseWithState<ScreenState> {
  @override
  ScreenState get currentState => super.currentState!;

  final Cache cache = Cache();

  LoginBloc() {
    setState(ScreenState());
  }

  void changeDisabled(String value) async {
    if (value.isEmpty) {
      setState(ScreenState(disabled: true));
    } else {
      setState(ScreenState(disabled: false));
    }
  }

  void login(BuildContext context, String name) async {
    if (currentState.disabled == false) {
      cache.saveName(name);
      context.router.push(const MnemonicRoute());
    }
  }
}

class ScreenState {
  final bool disabled;

  ScreenState({this.disabled = true});

  ScreenState copyWith({bool? disabled}) {
    return ScreenState(disabled: disabled ?? this.disabled);
  }
}
