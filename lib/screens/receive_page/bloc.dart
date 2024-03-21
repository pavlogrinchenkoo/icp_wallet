import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:isp_wallet/api/cache.dart';
import 'package:isp_wallet/utils/bloc_base.dart';
import 'package:isp_wallet/widgets/custom_show_dialog.dart';

class ReceiveBloc extends BlocBaseWithState<ScreenState> {
  @override
  ScreenState get currentState => super.currentState!;

  final Cache cache = Cache();

  ReceiveBloc() {
    setState(ScreenState());
  }

  void init(BuildContext context) async {
    final mnemonic = await cache.getMnemonic();
    setState(currentState.copyWith(mnemonic: mnemonic));
    if (mnemonic == 1) {
      setState(currentState.copyWith(
          address:
              'f882f89eeeae6ede2fc237f8cf0e962ea85636c54dac665d856f29b9ce6ce28b'));
    } else if (mnemonic == 2) {
      setState(currentState.copyWith(
          address:
              '541566bd3c7f9f7cb71be8a7860a45d8eb0fbacd2ebdfc97b85df919e05da8a1'));
    } else if (mnemonic == 3) {
      setState(currentState.copyWith(
          address:
              'f1c103010a8783df27dc73f39f3e23048ba48c9600bf4488cf2fefb8e83f42d9'));
    }
  }

  void copy(BuildContext context) async {
    bool isTapped = false;
    Clipboard.setData(ClipboardData(text: currentState.address));
    showDialog(
        context: context,
        builder: (_) {
          return CustomShowDialog(
            height: 136,
            title: 'Your receive number was copied!',
            buttonOne: 'OK',
            onTapOne: () {
              isTapped = true;
              return context.router.pop();
            },
            padding: const EdgeInsets.symmetric(horizontal: 32),
          );
        });
    await Future.delayed(const Duration(seconds: 3));
    if (!isTapped) {
      if (context.mounted) context.router.pop();
    }
  }
}

class ScreenState {
  final bool loading;
  final String address;
  final int mnemonic;

  ScreenState({this.loading = false, this.address = '', this.mnemonic = 0});

  ScreenState copyWith({bool? loading, String? address, int? mnemonic}) {
    return ScreenState(
        loading: loading ?? this.loading,
        address: address ?? this.address,
        mnemonic: mnemonic ?? this.mnemonic);
  }
}
