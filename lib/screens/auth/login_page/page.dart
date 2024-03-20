import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:isp_wallet/generated/assets.gen.dart';
import 'package:isp_wallet/style.dart';
import 'package:isp_wallet/utils/custom_stream_builder.dart';
import 'package:isp_wallet/utils/spaces.dart';
import 'package:isp_wallet/widgets/custom_buttom.dart';
import 'package:isp_wallet/widgets/custom_scaffold.dart';
import 'package:isp_wallet/widgets/custom_textfield.dart';

import 'bloc.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginBloc bloc = LoginBloc();
  final TextEditingController controller = TextEditingController();

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
                  children: [
                    const Spacer(),
                    Assets.icons.personBall.svg(),
                    Space.h32,
                    Text('my Profile '.toUpperCase(),
                        style: BS.bold24.apply(color: BC.blue)),
                    Space.h24,
                    Text('Please enter your account Name',
                        style: BS.bold20, textAlign: TextAlign.center),
                    Space.h22,
                    CustomTextField(
                      maxLength: 15,
                      controller: controller,
                      labelText: 'Your Name',
                      onChanged: (value) {
                        bloc.changeDisabled(value);
                      },
                    ),
                    Space.h22,
                    CustomButtonBlue(
                      onTap: () => bloc.login(context, controller.text),
                      text: 'CONTINUE',
                      disabled: state.disabled,
                    ),
                    Spacer(),
                    Text(
                      'You can later change the account name you set',
                      style: BS.bold20,
                      textAlign: TextAlign.center,
                    ),
                    Space.h16
                  ],
                ),
              ),
            ),
          );
        });
  }
}
