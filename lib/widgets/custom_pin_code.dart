import 'package:flutter/material.dart';
import 'package:isp_wallet/generated/assets.gen.dart';
import 'package:isp_wallet/screens/auth/pincode_page/bloc.dart';
import 'package:isp_wallet/style.dart';
import 'package:isp_wallet/utils/spaces.dart';

class CustomPinCode extends StatelessWidget {
  final TextEditingController controller;
  final PincodeBloc bloc;
  final bool allDisabled;

  const CustomPinCode(
      {super.key,
      required this.controller,
      required this.bloc,
      required this.allDisabled});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            (allDisabled) ? const _CustomButtonDisable(
              text: '1',
            ) : _CustomButton(
              onTap: () {
                bloc.changePin(context, '1');
              },
              text: '1',
            ),
            (allDisabled) ? const _CustomButtonDisable(
              text: '2',
            ) : _CustomButton(
              onTap: () {
                bloc.changePin(context, '2');
              },
              text: '2',
            ),
            (allDisabled) ? const _CustomButtonDisable(
              text: '3',
            ) : _CustomButton(
              onTap: () {
                bloc.changePin(context, '3');
              },
              text: '3',
            ),
          ],
        ),
        Space.h32,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            (allDisabled) ? const _CustomButtonDisable(
              text: '4',
            ) :  _CustomButton(
              onTap: () {
                bloc.changePin(context, '4');
              },
              text: '4',
            ),
            (allDisabled) ? const _CustomButtonDisable(
              text: '5',
            ) :  _CustomButton(
              onTap: () {
                bloc.changePin(context, '5');
              },
              text: '5',
            ),
            (allDisabled) ? const _CustomButtonDisable(
              text: '6',
            ) :_CustomButton(
              onTap: () {
                bloc.changePin(context, '6');
              },
              text: '6',
            ),
          ],
        ),
        Space.h32,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            (allDisabled) ? const _CustomButtonDisable(
              text: '7',
            ) :  _CustomButton(
              onTap: () {
                bloc.changePin(context, '7');
              },
              text: '7',
            ),
            (allDisabled) ? const _CustomButtonDisable(
              text: '8',
            ) :  _CustomButton(
              onTap: () {
                bloc.changePin(context, '8');
              },
              text: '8',
            ),
            (allDisabled) ? const _CustomButtonDisable(
              text: '9',
            ) : _CustomButton(
              onTap: () {
                bloc.changePin(context, '9');
                print(controller.text);
              },
              text: '9',
            ),
          ],
        ),
        Space.h32,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(width: 58),
            (allDisabled) ? const _CustomButtonDisable(
              text: '0',
            ) :  _CustomButton(
              onTap: () {
                bloc.changePin(context, '0');
              },
              text: '0',
            ),
            _CustomButtonRemove(
              onTap: () {
                bloc.removePin();
                print(controller.text);
              },
            ),
          ],
        )
      ],
    );
  }
}

class _CustomButton extends StatefulWidget {
  final String? text;
  final void Function()? onTap;

  const _CustomButton({super.key, this.text, this.onTap});

  @override
  State<_CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<_CustomButton> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          isTapped = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          isTapped = false;
        });
        // widget.onTap?.call();
      },
      onTap: widget.onTap,
      child: Container(
        width: 58,
        height: 58,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: !isTapped
                    ? [BC.blue, BC.blueGreen]
                    : [BC.darkGreen, BC.green])),
        child: Center(child: Text(widget.text ?? '', style: BS.bold26Grotesk)),
      ),
    );
  }
}

class _CustomButtonRemove extends StatefulWidget {
  final String? text;
  final void Function()? onTap;

  const _CustomButtonRemove({super.key, this.text, this.onTap});

  @override
  State<_CustomButtonRemove> createState() => _CustomButtonRemoveState();
}

class _CustomButtonRemoveState extends State<_CustomButtonRemove> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          isTapped = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          isTapped = false;
        });
        // widget.onTap?.call();
      },
      onTap: widget.onTap,
      child: Container(
        width: 58,
        height: 58,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2, color: !isTapped ? BC.blue : BC.green),
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: !isTapped
                    ? [BC.blue.withOpacity(0.3), BC.blueGreen.withOpacity(0.3)]
                    : [
                        BC.darkGreen.withOpacity(0.3),
                        BC.green.withOpacity(0.3)
                      ])),
        child: Center(child: Padding(
          padding: const EdgeInsets.only(right: 4),
          child: Assets.icons.remuwe.svg(),
        )),
      ),
    );
  }
}

class _CustomButtonDisable extends StatelessWidget {
  final String? text;
  final void Function()? onTap;

  const _CustomButtonDisable({super.key, this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 58,
      height: 58,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 2, color: BC.blue),
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                BC.blue.withOpacity(0.3),
                BC.blueGreen.withOpacity(0.3)
              ])),
      child: Center(child: Text(text ?? '', style: BS.bold26Grotesk)),
    );
  }
}
