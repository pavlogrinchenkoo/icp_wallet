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
class MnemonicPage extends StatefulWidget {
  const MnemonicPage({super.key});

  @override
  State<MnemonicPage> createState() => _MnemonicPageState();
}

class _MnemonicPageState extends State<MnemonicPage> {
  final MnemonicBloc bloc = MnemonicBloc();
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    bloc.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: CustomStreamBuilder(
          bloc: bloc,
          builder: (BuildContext context, ScreenState state) {
            return CustomScaffold(
                body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
              child: Center(
                child: Column(
                  children: [
                    Text('Welcome back!'.toUpperCase(),
                        style: BS.bold24.apply(color: BC.blue),
                        textAlign: TextAlign.center),
                    Space.h16,
                    Text('You log into your account as',
                        style: BS.bold20, textAlign: TextAlign.center),
                    Space.h16,
                    Text(state.name,
                        style: BS.bold24.apply(fontStyle: FontStyle.italic),
                        textAlign: TextAlign.center),
                    Space.h22,
                    Assets.icons.union.svg(
                      width: 90,
                      height: 90,
                    ),
                    Space.h16,
                    Text('Mnemonic Phrase',
                        style: BS.bold24, textAlign: TextAlign.center),
                    Space.h22,
                    CustomTextFieldBig(
                        labelText: 'Please enter your Mnemonic Phrase',
                        controller: controller,
                        onChanged: (value) {
                          bloc.changeDisabled(value);
                        }),
                    Space.h32,
                    CustomButtonBlue(
                      onTap: () => bloc.login(context, controller.text),
                      text: 'CONTINUE',
                      disabled: state.disabled,
                    )
                  ],
                ),
              ),
            ));
          }),
    );
  }
}
