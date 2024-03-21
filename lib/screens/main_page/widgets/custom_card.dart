import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:isp_wallet/generated/assets.gen.dart';
import 'package:isp_wallet/style.dart';
import 'package:isp_wallet/utils/spaces.dart';

class CustomCard extends StatefulWidget {
  final String? address;
  final Function()? onTap;

  const CustomCard({super.key, this.address, this.onTap});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool isTaped = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: 20,
          right: 0,
          child: Container(
              width: MediaQuery.of(context).size.width - 64 - 20,
              height: 175,
              decoration: BoxDecoration(
                  borderRadius: BRadius.r21,
                  color: BC.purple.withOpacity(0.3))),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            width: MediaQuery.of(context).size.width - 64 - 20,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: BC.black.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 5,
                    offset: const Offset(8, 10),
                  ),
                ],
                borderRadius: BRadius.r21,
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [BC.greyGreen, BC.blackGreen])),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Assets.icons.logo.svg(
                      width: 54,
                      height: 54,
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('0.0000', style: BS.bold32),
                        Text('ICP', style: BS.light25),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('My Wallet:', style: BS.light18),
                        Space.h8,
                        Row(
                          children: [
                            Container(
                              width: 135,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 4),
                              decoration: BoxDecoration(
                                borderRadius: BRadius.r32,
                                border: Border.all(color: BC.white, width: 1),
                                color: BC.white.withOpacity(0.85),
                              ),
                              child: Text(
                                widget.address ?? '',
                                style: BS.light12,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Space.w8,
                            GestureDetector(
                                onTapCancel: () {
                                  setState(() {
                                    isTaped = false;
                                  });
                                },
                                onTapDown: (_) {
                                  setState(() {
                                    isTaped = true;
                                  });
                                },
                                onTapUp: (_) {
                                  setState(() {
                                    isTaped = false;
                                  });
                                },
                                onTap: widget.onTap,
                                child: isTaped
                                    ? Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            boxShadow: [
                                              BoxShadow(
                                                color:
                                                    BC.green.withOpacity(0.3),
                                                spreadRadius: 5,
                                                blurRadius: 5,
                                                offset: const Offset(-1, 0),
                                              ),
                                            ]),
                                        child: Assets.icons.copyGreen.svg(
                                          width: 14,
                                        ),
                                      )
                                    : Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            boxShadow: [
                                              BoxShadow(
                                                color:
                                                    BC.white.withOpacity(0.3),
                                                spreadRadius: 5,
                                                blurRadius: 5,
                                                offset: const Offset(-1, 0),
                                              ),
                                            ]),
                                        child: Assets.icons.copyW.svg(
                                          width: 14,
                                        ),
                                      ))
                          ],
                        )
                      ],
                    ),
                    Text('0.00 \$', style: BS.light18),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
