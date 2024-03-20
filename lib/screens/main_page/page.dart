import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:isp_wallet/generated/assets.gen.dart';
import 'package:isp_wallet/style.dart';
import 'package:isp_wallet/utils/custom_stream_builder.dart';
import 'package:isp_wallet/utils/spaces.dart';
import 'package:isp_wallet/widgets/custom_buttom.dart';
import 'package:isp_wallet/widgets/custom_scaffold.dart';

import 'bloc.dart';
import 'widgets/custom_card.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final MainBloc bloc = MainBloc();

  @override
  void initState() {
    bloc.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomStreamBuilder(
        bloc: bloc,
        builder: (BuildContext context, ScreenState state) {
          return CustomScaffold(
            body: Column(
              children: [
                Expanded(
                  flex: 10,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      children: [
                        Space.h48,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                             QR(
                              onTap: () => bloc.qrCode(context),
                            ),
                            _NameEdit(
                              onTapEdit: () => bloc.edit(context),
                              onTapLogout: () => bloc.logout(context),
                              name: state.name,
                            ),
                          ],
                        ),
                        Space.h16,
                         Expanded(child: CustomCard(
                          onTap: () => bloc.copy(context),
                          address: state.address,
                        )),
                        CustomTwoButton(
                          onTapSend: () => bloc.goToSend(context),
                          onTapReceive: () => bloc.goToReceive(context),
                        ),
                      ],
                    ),
                  ),
                ),
                Space.h32,
                Expanded(
                  flex: 9,
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(21),
                        ),
                        image: DecorationImage(
                            image: Assets.images.fon.image().image,
                            fit: BoxFit.cover)),
                    child: Column(
                      children: [
                        Text('Transaction History'.toUpperCase(),
                            style: BS.bold20),
                        Expanded(child: Assets.images.wallet.image()),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

class QR extends StatefulWidget {
  final Function() onTap;
  const QR({super.key, required this.onTap});

  @override
  State<QR> createState() => _QRState();
}

class _QRState extends State<QR> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => isPressed = true),
      onTapUp: (_) => setState(() => isPressed = false),
      onTap: widget.onTap,

      child: Row(
        children: [
          (isPressed) ? Assets.icons.unionGreen.svg() : Assets.icons.group.svg(),
          Space.w4,
          Text('QR', style: BS.bold20.apply(color: isPressed ? BC.green : BC.white.withOpacity(0.8))),
        ],
      ),
    );
  }
}

class _NameEdit extends StatefulWidget {
  final String name;
  final Function() onTapEdit;
  final Function() onTapLogout;

  const _NameEdit(
      {super.key,
      required this.name,
      required this.onTapEdit,
      required this.onTapLogout});

  @override
  State<_NameEdit> createState() => _NameEditState();
}

class _NameEditState extends State<_NameEdit> {
  bool isPressedEdit = false;
  bool isPressedLogout = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
    GestureDetector(
    onTapDown: (_) => setState(() => isPressedEdit = true),
    onTapUp: (_) => setState(() => isPressedEdit = false),
    onTap: widget.onTapEdit, child: (isPressedEdit) ? Assets.icons.editGreen.svg() : Assets.icons.edit.svg()),
        Space.w4,
        Text(widget.name, style: BS.bold20),
        Space.w16,
        GestureDetector(
            onTapDown: (_) => setState(() => isPressedLogout = true),
            onTapUp: (_) => setState(() => isPressedLogout = false),
            onTap: widget.onTapLogout, child: (isPressedLogout) ? Assets.icons.logoutGreen.svg() : Assets.icons.logout.svg()),
      ],
    );
  }
}

class CustomTwoButton extends StatelessWidget {
  final Function()? onTapSend;
  final Function()? onTapReceive;

  const CustomTwoButton({super.key, this.onTapSend, this.onTapReceive});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButtonBlueWidget(
            onTap: onTapSend,
            text: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('SEND', style: BS.bold20),
                Assets.icons.down.svg(),
              ],
            ),
          ),
        ),
        Space.w22,
        Expanded(
          child: CustomButtonBlueWidget(
            onTap: onTapReceive,
            text: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('receive'.toUpperCase(), style: BS.bold20),
                Assets.icons.up.svg(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
