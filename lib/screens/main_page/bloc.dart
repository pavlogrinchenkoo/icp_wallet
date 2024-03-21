import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:isp_wallet/api/cache.dart';
import 'package:isp_wallet/generated/assets.gen.dart';
import 'package:isp_wallet/routers/routes.dart';
import 'package:isp_wallet/style.dart';
import 'package:isp_wallet/utils/bloc_base.dart';
import 'package:isp_wallet/utils/spaces.dart';
import 'package:isp_wallet/widgets/custom_show_dialog.dart';
import 'package:isp_wallet/widgets/custom_textfield.dart';

class MainBloc extends BlocBaseWithState<ScreenState> {
  @override
  ScreenState get currentState => super.currentState!;

  final Cache cache = Cache();

  MainBloc() {
    setState(ScreenState());
  }

  void init() async {
    final name = await cache.getName();
    final mnemonic = await cache.getMnemonic();
    setState(currentState.copyWith(mnemonic: mnemonic));
    if (mnemonic == 1) {
      setState(currentState.copyWith(address: 'f882f89ee…e6ce28b'));
    } else if (mnemonic == 2) {
      setState(currentState.copyWith(address: '541566bd3…05da8a1'));
    } else if (mnemonic == 3) {
      setState(currentState.copyWith(address: 'f1c103010…83f42d9'));
    }
    setState(currentState.copyWith(name: name));
  }

  void logout(BuildContext context) async {
    showDialog(
        context: context,
        builder: (_) {
          return CustomShowDialog(
              title: 'CONFIRM!',
              content: 'Are you sure you want to log out of your account?',
              buttonTwo: 'Cancel',
              onTapTwo: () => context.router.pop(),
              buttonOne: 'Yes, I confirm',
              width: 270,
              onTapOne: () {
                cache.removeName();
                context.router.replaceAll([const AuthRoute()]);
              },
              padding: const EdgeInsets.symmetric(horizontal: 16));
        });
  }

  void goToSend(BuildContext context) async {
    context.router.push(const SendRoute());
  }

  void goToReceive(BuildContext context) async {
    context.router.push(const ReceiveRoute());
  }

  void qrCode(BuildContext context) async {
    showDialog(
        context: context,
        builder: (_) {
          return CustomShowDialog(
            height: 272,
            widget: (currentState.mnemonic == 1)
                ? Assets.images.qrcode1.image(width: 190, height: 190)
                : (currentState.mnemonic == 2)
                    ? Assets.images.qrcode2.image(width: 190, height: 190)
                    : Assets.images.qrcode3.image(width: 190, height: 190),
            buttonOne: 'OK',
            onTapOne: () => context.router.pop(),
          );
        });
  }

  void copy(BuildContext context) async {
    bool isTapped = false;
    String address = '';
    if (currentState.mnemonic == 1) {
      address =
          'f882f89eeeae6ede2fc237f8cf0e962ea85636c54dac665d856f29b9ce6ce28b';
    } else if (currentState.mnemonic == 2) {
      address =
          '541566bd3c7f9f7cb71be8a7860a45d8eb0fbacd2ebdfc97b85df919e05da8a1';
    } else if (currentState.mnemonic == 3) {
      address =
          'f1c103010a8783df27dc73f39f3e23048ba48c9600bf4488cf2fefb8e83f42d9';
    }
    Clipboard.setData(ClipboardData(text: address));
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

  void edit(BuildContext context) async {
    TextEditingController controller = TextEditingController();
    showDialog(
        context: context,
        builder: (_) {
          return CustomShowDialog(
            height: 211,
            widget: Column(
              children: [
                Assets.icons.userCircle.svg(),
                Text(
                  'Re-name Account',
                  style: BS.sb18.apply(color: BC.black),
                ),
                Space.h8,
                CustomTextFieldDialog(
                  controller: controller,
                  labelText: 'Enter new account name',
                  maxLength: 12,
                ),
              ],
            ),
            buttonOne: 'Cancel',
            onTapOne: () => context.router.pop(),
            buttonTwo: 'Confirm',
            onTapTwo: () async {
              setState(currentState.copyWith(name: controller.text));
              await cache.saveName(controller.text);
              if (context.mounted) context.router.pop();
            },
          );
        });
  }
}

class ScreenState {
  final bool loading;
  final String name;
  final String address;
  final int mnemonic;

  ScreenState(
      {this.loading = false,
      this.name = '',
      this.address = '',
      this.mnemonic = 0});

  ScreenState copyWith(
      {bool? loading, String? name, String? address, int? mnemonic}) {
    return ScreenState(
        loading: loading ?? this.loading,
        name: name ?? this.name,
        address: address ?? this.address,
        mnemonic: mnemonic ?? this.mnemonic);
  }
}
