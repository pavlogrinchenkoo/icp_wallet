import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:isp_wallet/utils/bloc_base.dart';
import 'package:isp_wallet/widgets/custom_show_dialog.dart';

class SendBloc extends BlocBaseWithState<ScreenState> {
  @override
  ScreenState get currentState => super.currentState!;

  SendBloc() {
    setState(ScreenState());
  }

  void changeDisabled(String address, String amount) async {
    if (amount.isEmpty) {
      setState(ScreenState(isDisabled: true));
    } else {
      setState(ScreenState(isDisabled: false));
    }
  }

  void send(BuildContext context) async {
    if (currentState.isDisabled == false) {
      showDialog(context: context, builder: (_) {
       return CustomShowDialog(
         height: 160,
          content: 'There are not enough funds on the account to complete the transaction',
          buttonOne: 'Close',
          onTapOne: () => context.router.pop(),
        );
      });
    }

  }
}

class ScreenState {
  final bool isDisabled;

  ScreenState({this.isDisabled = true});

  ScreenState copyWith({bool? isDisabled}) {
    return ScreenState(isDisabled: isDisabled ?? this.isDisabled);
  }
}
