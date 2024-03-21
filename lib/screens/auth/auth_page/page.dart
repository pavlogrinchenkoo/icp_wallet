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
class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final AuthBloc bloc = AuthBloc();

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
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Spacer(),
                  Expanded(child: Assets.icons.person.svg()),
                  Space.h64,
                  Text('Log in to \n get started'.toUpperCase(),
                      style: BS.reg24, textAlign: TextAlign.center),
                  Space.h32,
                  CustomButtonBlue(
                    onTap: () => bloc.goToLogin(context),
                    text: 'LOG IN',
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Check out our ',
                        style: BS.reg16,
                      ),
                      Text(
                        'Privacy Policy',
                        style: BS.reg16.apply(color: BC.darkBlue),
                      )
                    ],
                  ),
                  Space.h16
                ],
              ),
            ),
          ));
        });
  }
}
