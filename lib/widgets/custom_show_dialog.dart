import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:isp_wallet/style.dart';
import 'package:isp_wallet/utils/custom_functions.dart';
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

  const CustomShowDialog(
      {super.key,
      this.title,
      this.content,
      this.buttonOne,
      this.buttonTwo,
      this.onTapOne,
      this.onTapTwo,
      this.widget, this.height});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(
        horizontal: getAdaptivePadding(120),
      ),
      child: Container(
        width: 130,
        height: height ?? 150,
        decoration: BoxDecoration(
          color: BC.white,
          borderRadius: BRadius.r14,
        ),
        child: Column(
          children: [
            Space.h16,
           if(title != null) Padding(
             padding: const EdgeInsets.symmetric(horizontal: 16),
             child: Text(title ?? "",
                  style: BS.sb18.apply(color: BC.black),
                  textAlign: TextAlign.center),
           ),
            Space.h8,
          if(widget != null)  widget ?? const SizedBox(),
          if(content != null)  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(content ?? "",
                  style: BS.reg13.apply(color: BC.black),
                  textAlign: TextAlign.center),
            ),
            Space.h16,
            
            Container(
              height: 0.5,
              color: BC.black.withOpacity(0.3),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  (buttonOne != null)
                      ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: InkWell(
                            onTap: onTapOne,
                            child: Text(buttonOne ?? '',
                                style: BS.sb17.apply(color: BC.blackBlue)),
                          ),
                      )
                      : const SizedBox(),
                  const Spacer(),
                 if(buttonTwo != null)  Container(width: 0.5, height: 45, color: BC.black.withOpacity(0.3)),
                if(buttonTwo != null)  const Spacer(),
                  (buttonTwo != null)
                      ? InkWell(
                          onTap: onTapTwo,
                          child: Text(buttonTwo ?? '',
                              style: BS.sb17.apply(color: BC.blackBlue)))
                      : const SizedBox(),
                 if(buttonTwo != null) const Spacer(),
                ],
              ),
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
