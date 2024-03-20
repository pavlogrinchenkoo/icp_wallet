import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:isp_wallet/generated/assets.gen.dart';
import 'package:isp_wallet/style.dart';
import 'package:isp_wallet/utils/custom_stream_builder.dart';
import 'package:isp_wallet/utils/spaces.dart';
import 'package:isp_wallet/widgets/custom_buttom.dart';
import 'package:isp_wallet/widgets/custom_scaffold.dart';

import 'bloc.dart';

@RoutePage()
class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  final InfoBloc bloc = InfoBloc();
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return CustomStreamBuilder(
        bloc: bloc,
        builder: (BuildContext context, ScreenState state) {
          return CustomScaffold(
              body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
            child: Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 117,
                        child: (state.page == 2)
                            ? CustomButtonGreen(
                                onTap: () => bloc.next(pageController, context),
                                text: 'SKIP')
                            : CustomButtonBlue(
                                onTap: () => bloc.skip(context),
                                text: 'SKIP',
                              ),
                      ),
                    ],
                  ),
                  Space.h16,
                  Expanded(
                    child: PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: pageController,
                      children: [
                        Column(
                          children: [
                            Assets.images.phone.image(),
                            Text(
                                'Send And Receive Coins In Your Phone'
                                    .toUpperCase(),
                                style: BS.reg24,
                                textAlign: TextAlign.center),
                          ],
                        ),
                        Column(
                          children: [
                            Assets.images.trafik.image(),
                            Text('Modern Technologies'.toUpperCase(),
                                style: BS.reg24, textAlign: TextAlign.center),
                          ],
                        ),
                        Column(
                          children: [
                            Space.h32,
                            Assets.images.banck.image(),
                            Text('Instant Transactions'.toUpperCase(),
                                style: BS.reg24, textAlign: TextAlign.center),
                          ],
                        ),
                      ],
                    ),
                  ),
                  (state.page == 2)
                      ? CustomButtonGreen(
                          onTap: () => bloc.next(pageController, context),
                          text: 'Continue'.toUpperCase())
                      : CustomButtonBlue(
                          onTap: () => bloc.next(pageController, context),
                          text: 'Continue'.toUpperCase(),
                        ),
                  Space.h64,
                  _CustomBoll(
                    index: state.page,
                  ),
                ],
              ),
            ),
          ));
        });
  }
}

class _CustomBoll extends StatelessWidget {
  final int index;

  const _CustomBoll({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < 3; i++)
          Container(
            margin: EdgeInsets.only(right: i == 2 ? 0 : 8),
            width: 18,
            height: 18,
            decoration: BoxDecoration(
                borderRadius: BRadius.r50,
                boxShadow: [
                  if (i == index)
                    BoxShadow(
                        color: BC.darkGreen.withOpacity(0.5),
                        blurRadius: 8,
                        offset: const Offset(5, 5))
                ],
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: i == index
                        ? [BC.darkGreen, BC.green]
                        : [
                            BC.darkGreen.withOpacity(0.3),
                            BC.green.withOpacity(0.3)
                          ])),
          ),
      ],
    );
  }
}
