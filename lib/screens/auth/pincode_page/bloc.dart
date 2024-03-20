import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:isp_wallet/routers/routes.dart';
import 'package:isp_wallet/utils/bloc_base.dart';

class PincodeBloc extends BlocBaseWithState<ScreenState> {
  @override
  ScreenState get currentState => super.currentState!;

  PincodeBloc() {
    setState(ScreenState());
  }

  void changePin(BuildContext context, String value) async {
    setState(currentState.copyWith(pin: '${currentState.pin}$value'));
    if (currentState.pin.length == 5) {
      setState(currentState.copyWith(allDisabled: true));
      await Future.delayed(const Duration(seconds: 3));
      if (context.mounted) context.router.replaceAll([const MainRoute()]);
    }
  }

  void removePin() {
    setState(currentState.copyWith(
        pin: currentState.pin.substring(0, currentState.pin.length - 1),
        allDisabled: false));
  }
}

class ScreenState {
  final bool allDisabled;
  final String pin;

  ScreenState({this.allDisabled = false, this.pin = ''});

  ScreenState copyWith({bool? allDisabled, String? pin}) {
    return ScreenState(
        allDisabled: allDisabled ?? this.allDisabled, pin: pin ?? this.pin);
  }
}
