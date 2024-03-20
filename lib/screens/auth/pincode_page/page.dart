import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:isp_wallet/style.dart';
import 'package:isp_wallet/utils/custom_stream_builder.dart';
import 'package:isp_wallet/utils/spaces.dart';
import 'package:isp_wallet/widgets/custom_pin_code.dart';
import 'package:isp_wallet/widgets/custom_scaffold.dart';

import 'bloc.dart';

@RoutePage()
class PincodePage extends StatefulWidget {
  const PincodePage({super.key});

  @override
  State<PincodePage> createState() => _PincodePageState();
}

class _PincodePageState extends State<PincodePage> {
  final PincodeBloc bloc = PincodeBloc();
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomStreamBuilder(
        bloc: bloc,
        builder: (BuildContext context, ScreenState state) {
          return CustomScaffold(
              body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Text('Create New Pin-Code'.toUpperCase(),
                        style: BS.bold24, textAlign: TextAlign.center)),
                Space.h32,
                _CustomBall(
                  allDisabled: state.allDisabled,
                  count: state.pin.length,
                ),
                Space.h32,
                CustomPinCode(
                  allDisabled: state.allDisabled,
                  controller: controller,
                  bloc: bloc,
                ),
              ],
            ),
          ));
        });
  }
}

class _CustomBall extends StatelessWidget {
  final int count;
  final bool allDisabled;

  const _CustomBall(
      {super.key, required this.count, required this.allDisabled});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < 5; i++)
          Container(
            margin: const EdgeInsets.only(right: 20),
            height: 22,
            width: 22,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: allDisabled
                  ? BC.green
                  : (i < count)
                      ? BC.blue
                      : BC.blue.withOpacity(0.2),
            ),
          ),
      ],
    );
  }
}

class _CustomBallRemove extends StatelessWidget {
  const _CustomBallRemove({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < 6; i++)
          Container(
            margin: const EdgeInsets.only(right: 20),
            height: 22,
            width: 22,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: BC.blue,
            ),
          ),
      ],
    );
  }
}
