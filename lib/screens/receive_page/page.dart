import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:isp_wallet/generated/assets.gen.dart';
import 'package:isp_wallet/style.dart';
import 'package:isp_wallet/utils/custom_stream_builder.dart';
import 'package:isp_wallet/utils/spaces.dart';
import 'package:isp_wallet/widgets/custom_scaffold.dart';

import 'bloc.dart';

@RoutePage()
class ReceivePage extends StatefulWidget {
  const ReceivePage({super.key});

  @override
  State<ReceivePage> createState() => _ReceivePageState();
}

class _ReceivePageState extends State<ReceivePage> {
  final ReceiveBloc bloc = ReceiveBloc();
  bool isTapped = false;

  @override
  void initState() {
    bloc.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomStreamBuilder(
        bloc: bloc,
        builder: (BuildContext context, ScreenState state) {
          return CustomScaffold(
              appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  actions: [
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () => context.router.pop(),
                      child: Row(
                        children: [
                          Space.w22,
                          Icon(Icons.arrow_back_ios_new_sharp,
                              color: BC.white, size: 20),
                          Space.w4,
                          Text('Back', style: BS.med18),
                        ],
                      ),
                    ),
                    const Spacer(),
                  ]),
              body: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
                child: Column(
                  children: [
                    Space.h32,
                    _CustomContainer(
                      child: Column(
                        children: [
                          Text('Receive'.toUpperCase(), style: BS.bold24),
                          Space.h16,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Your receive number', style: BS.reg15),
                              Space.h8,
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 6),
                                decoration: BoxDecoration(
                                  borderRadius: BRadius.r10,
                                  color: BC.white.withOpacity(0.2),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                      state.address ?? '',
                                      style: BS.reg18,
                                    )),
                                    Space.w22,
                                    GestureDetector(
                                        onTapDown: (_) =>
                                            setState(() => isTapped = true),
                                        onTapUp: (_) =>
                                            setState(() => isTapped = false),
                                        onTap: () => bloc.copy(context),
                                        child: isTapped
                                            ? Assets.icons.copyGreen
                                                .svg(width: 20, height: 20)
                                            : Assets.icons.copy
                                                .svg(width: 20, height: 20))
                                  ],
                                ),
                              ),
                              Space.h32,
                            ],
                          ),
                        ],
                      ),
                    ),
                    Space.h24,
                    _CustomContainer(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Assets.icons.group.svg(),
                              Space.w8,
                              Text('QR Code', style: BS.bold20),
                            ],
                          ),
                          Space.h8,
                          if (state.mnemonic == 1)
                            Assets.images.qrcode1.image(
                              width: 200,
                              height: 200,
                              fit: BoxFit.fill,
                            ),
                          if (state.mnemonic == 2)
                            Assets.images.qrcode2.image(
                              width: 200,
                              height: 200,
                              fit: BoxFit.fill,
                            ),
                          if (state.mnemonic == 3)
                            Assets.images.qrcode3.image(
                              width: 200,
                              height: 200,
                              fit: BoxFit.fill,
                            ),
                          Space.h8,
                        ],
                      ),
                    ),
                  ],
                ),
              ));
        });
  }
}

class _CustomContainer extends StatelessWidget {
  final Widget child;

  const _CustomContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
      decoration: BoxDecoration(
          borderRadius: BRadius.r21,
          image: DecorationImage(
              image: Assets.images.bagraund.image().image, fit: BoxFit.fill)),
      child: child,
    );
  }
}
