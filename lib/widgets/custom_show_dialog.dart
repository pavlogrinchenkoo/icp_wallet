import 'package:flutter/material.dart';
import 'package:isp_wallet/style.dart';
import 'package:isp_wallet/utils/spaces.dart';

class CustomShowDialog extends StatelessWidget {
  final String? title;
  final String? content;
  final String? buttonOne;
  final String? buttonTwo;
  final Function()? onTapOne;
  final Function()? onTapTwo;
  final Widget? widget;
  final double? height;
  final double? width;
  final EdgeInsets? padding;

  const CustomShowDialog(
      {super.key,
      this.title,
      this.content,
      this.buttonOne,
      this.buttonTwo,
      this.onTapOne,
      this.onTapTwo,
      this.widget,
      this.height,
      this.width,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: width ?? 230,
        height: height ?? 150,
        decoration: BoxDecoration(
          color: BC.white,
          borderRadius: BRadius.r14,
        ),
        child: Column(
          children: [
            Space.h16,
            if (title != null)
              Padding(
                padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
                child: Text(title ?? "",
                    style: BS.sb18.apply(color: BC.black),
                    textAlign: TextAlign.center),
              ),
            Space.h8,
            if (widget != null) widget ?? const SizedBox(),
            if (content != null)
              Padding(
                padding: padding ?? const EdgeInsets.symmetric(horizontal: 8),
                child: Text(content ?? "",
                    style: title != null
                        ? BS.reg13.apply(color: BC.black)
                        : BS.reg18.apply(color: BC.black),
                    textAlign: TextAlign.center),
              ),
            Space.h16,
            Container(
              height: 0.5,
              color: BC.black.withOpacity(0.3),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                (buttonOne != null)
                    ? Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: InkWell(
                            onTap: onTapOne,
                            child: Center(
                              child: Text(buttonOne ?? '',
                                  style: BS.sb17.apply(color: BC.blackBlue)),
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
                if (buttonTwo != null)
                  Container(
                      width: 0.5,
                      height: 45,
                      color: BC.black.withOpacity(0.3)),
                (buttonTwo != null)
                    ? Expanded(
                        child: InkWell(
                            onTap: onTapTwo,
                            child: Center(
                              child: Text(buttonTwo ?? '',
                                  style: BS.sb17.apply(color: BC.blackBlue)),
                            )),
                      )
                    : const SizedBox(),
              ],
            )
          ],
        ),
      ),
      // shape: RoundedRectangleBorder(
      //   borderRadius: BRadius.r14,
      // ),
      // title: Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Text(title ?? "", style: BS.sb18.apply(color: BC.black), textAlign: TextAlign.center),
      //     (text != null)
      //         ? Row(
      //       children: [
      //         Space.w8,
      //         text ?? const SizedBox(),
      //       ],
      //     )
      //         : const SizedBox(),
      //   ],
      // ),
      // content:
      // Text(content ?? "", style: BS.reg13.apply(color: BC.black), textAlign: TextAlign.center),
      // actions: <Widget>[
      //   Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       (buttonOne != null) ? InkWell(
      //         onTap: onTapOne,
      //         child: Text(buttonOne ?? '', style: BS.sb17.apply(color: BC.blackBlue)),
      //       ) : const SizedBox(),
      //       Space.h16,
      //       (buttonTwo != null) ? InkWell(onTap: onTapTwo, child: Text(buttonTwo ?? '', style: BS.sb17..apply(color: BC.blackBlue))) : const SizedBox(),
      //     ],
      //   )
      // ],
    );
  }
}
