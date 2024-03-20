import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:isp_wallet/generated/assets.gen.dart';
import 'package:isp_wallet/style.dart';
import 'package:isp_wallet/utils/custom_stream_builder.dart';
import 'package:isp_wallet/utils/spaces.dart';
import 'package:isp_wallet/widgets/custom_scaffold.dart';

import 'bloc.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SplashBloc bloc = SplashBloc();

  @override
  void initState() {
    super.initState();
    bloc.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return CustomStreamBuilder(
        bloc: bloc,
        builder: (BuildContext context, ScreenState state) {
          return CustomScaffold(
              body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Assets.icons.logo.svg()),
              Space.h16,
              Text('ICP WALLET', style: BS.bold40,)
            ],
          ));
        });
  }
}
