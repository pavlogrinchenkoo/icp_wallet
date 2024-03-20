import 'package:flutter/material.dart';
import 'package:isp_wallet/style.dart';

class CustomButtonBlue extends StatefulWidget {
  const CustomButtonBlue({this.text, this.onTap, super.key, this.disabled = false});

  final String? text;
  final void Function()? onTap;
  final bool disabled;

  @override
  State<CustomButtonBlue> createState() => _CustomButtonBlueState();
}

class _CustomButtonBlueState extends State<CustomButtonBlue> {
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
      },
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BRadius.r32,
            color: widget.disabled ? BC.black.withOpacity(0.2) : null,
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: !isTapped ? [BC.blue, BC.blueGreen] : [BC.darkGreen, BC.green])),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(child: Text(widget.text ?? '', style: BS.bold20.apply(color: widget.disabled ? BC.white.withOpacity(0.2) : BC.white))),
        ),
      ),
    );
  }
}


class CustomButtonGreen extends StatelessWidget {
  const CustomButtonGreen({this.text, this.onTap, super.key});

  final String? text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BRadius.r32,
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [BC.darkGreen, BC.green])),
      child: InkWell(
          borderRadius: BRadius.r32,
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Center(child: Text(text ?? '', style: BS.bold20)),
          )),
    );
  }
}

class CustomButtonBlueWidget extends StatefulWidget {
  const CustomButtonBlueWidget({this.text, this.onTap, super.key, this.disabled = false});

  final Widget? text;
  final void Function()? onTap;
  final bool disabled;

  @override
  State<CustomButtonBlueWidget> createState() => _CustomButtonBlueWidgetState();
}

class _CustomButtonBlueWidgetState extends State<CustomButtonBlueWidget> {
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
      },
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BRadius.r32,
            color: widget.disabled ? BC.black.withOpacity(0.2) : null,
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: !isTapped ? [BC.blue, BC.blueGreen] : [BC.darkGreen, BC.green])),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
          child: Center(child: widget.text),
        ),
      ),
    );
  }
}