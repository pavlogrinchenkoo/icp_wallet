import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:isp_wallet/generated/assets.gen.dart';
import 'package:isp_wallet/style.dart';
import 'package:isp_wallet/utils/custom_stream_builder.dart';
import 'package:isp_wallet/utils/spaces.dart';
import 'package:isp_wallet/widgets/custom_buttom.dart';
import 'package:isp_wallet/widgets/custom_scaffold.dart';

import 'bloc.dart';

@RoutePage()
class StartInfoPage extends StatefulWidget {
  const StartInfoPage({super.key});

  @override
  State<StartInfoPage> createState() => _StartInfoPageState();
}

class _StartInfoPageState extends State<StartInfoPage> {
  final StartInfoBloc bloc = StartInfoBloc();

  @override
  Widget build(BuildContext context) {
    return CustomStreamBuilder(
        bloc: bloc,
        builder: (BuildContext context, ScreenState state) {
          return CustomScaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Assets.icons.logo.svg(),
                    Space.h16,
                    Text('INTERNET\nCOMPUTER',
                        style: BS.bold35, textAlign: TextAlign.center),
                    Space.h48,
                    Text('Discover the world of ICP coins'.toUpperCase(),
                        style: BS.reg24, textAlign: TextAlign.center),
                    Space.h32,
                    CustomButtonBlue(
                      onTap: () => bloc.goToInfo(context),
                      text: 'START',
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
