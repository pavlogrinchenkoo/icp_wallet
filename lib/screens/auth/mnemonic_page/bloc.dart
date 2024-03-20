import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:isp_wallet/api/cache.dart';
import 'package:isp_wallet/routers/routes.dart';
import 'package:isp_wallet/utils/bloc_base.dart';
import 'package:isp_wallet/widgets/custom_show_dialog.dart';

class MnemonicBloc extends BlocBaseWithState<ScreenState> {
  @override
  ScreenState get currentState => super.currentState!;

  final Cache cache = Cache();

  MnemonicBloc() {
    setState(ScreenState());
  }

  void init() async {
    final name = await cache.getName();
    setState(currentState.copyWith(name: name ?? ''));
  }

  void changeDisabled(String value) async {
    if (value.length <= 30) {
      setState(currentState.copyWith(disabled: true));
    } else {
      setState(currentState.copyWith(disabled: false));
    }
  }

  void login(BuildContext context, String value) async {
    const mnemonicPhrase1 =
        'picnic spend all only sheriff era summer mystery neck over barrel circle';
    const mnemonicPhrase2 =
        'vessel sock quantum vote refuse romance subject valley mix quote devote warrior';
    const mnemonicPhrase3 =
        'spoon execute sudden cluster ignore vast motor rail atom thrive level model';
    if (currentState.disabled == false) {
      if (value == mnemonicPhrase1 ||
          value == mnemonicPhrase2 ||
          value == mnemonicPhrase3) {
        if (value == mnemonicPhrase1) await cache.saveMnemonic(1);
        if (value == mnemonicPhrase2) await cache.saveMnemonic(2);
        if (value == mnemonicPhrase3) await cache.saveMnemonic(3);
        if (context.mounted) context.router.replaceAll([const PincodeRoute()]);
      } else {
        setState(currentState.copyWith(disabled: true));
        showDialog(
            context: context,
            builder: (_) => CustomShowDialog(
                  title: 'ERROR!',
                  content: 'Your Mnemonic Phrase entered incorrectly',
                  onTapOne: () => context.router.pop(),
                  buttonOne: 'Try again',
                ));
      }
    }
  }
}

class ScreenState {
  final bool disabled;
  final String name;

  ScreenState({this.disabled = true, this.name = ''});

  ScreenState copyWith({bool? disabled, String? name}) {
    return ScreenState(
        disabled: disabled ?? this.disabled, name: name ?? this.name);
  }
}
