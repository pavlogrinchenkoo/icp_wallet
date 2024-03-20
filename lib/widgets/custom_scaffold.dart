import 'package:flutter/material.dart';
import 'package:isp_wallet/generated/assets.gen.dart';

import 'package:isp_wallet/style.dart';


class CustomScaffold extends StatelessWidget {
  const CustomScaffold(
      {this.appBar, required this.body, this.bottomNavigationBar, super.key});

  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BC.black,
      appBar: appBar,
      bottomNavigationBar: bottomNavigationBar,
      body: SafeArea(child: body),
    );
  }
}
