import 'package:flutter/material.dart';
import 'package:isp_wallet/style.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? labelText;
  final Function(String) onChanged;
  final int? maxLength;

  const CustomTextField(
      {super.key,
      required this.controller,
      this.keyboardType,
      this.labelText,
      required this.onChanged,
      this.maxLength});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isVisible = false;

  @override
  void initState() {
    isVisible =
        (widget.keyboardType == TextInputType.visiblePassword) ? true : false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: widget.maxLength,
      buildCounter: (BuildContext context,
              {required int currentLength,
              required int? maxLength,
              required bool isFocused}) =>
          null,
      controller: widget.controller,
      cursorColor: BC.white.withOpacity(0.8),
      style: BS.med18,
      obscureText: isVisible,
      autocorrect: false,
      keyboardType: widget.keyboardType,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        fillColor: BC.white.withOpacity(0.2),
        filled: true,
        suffixIcon: (widget.keyboardType == TextInputType.visiblePassword)
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  child: Icon(
                      (!isVisible) ? Icons.visibility : Icons.visibility_off,
                      color: BC.white),
                ),
              )
            : null,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
        enabledBorder: OutlineInputBorder(
          borderRadius: BRadius.r10,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BRadius.r10,
          borderSide: BorderSide(color: BC.green, width: 1),
        ),
        hintText: widget.labelText,
        hintStyle: BS.med18.apply(color: BC.white.withOpacity(0.7)),
      ),
    );
  }
}

class CustomTextFieldBig extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? labelText;
  final Function(String) onChanged;

  const CustomTextFieldBig(
      {super.key,
      required this.controller,
      this.keyboardType,
      this.labelText,
      required this.onChanged});

  @override
  State<CustomTextFieldBig> createState() => _CustomTextFieldBigState();
}

class _CustomTextFieldBigState extends State<CustomTextFieldBig> {
  bool isVisible = false;

  @override
  void initState() {
    isVisible =
        (widget.keyboardType == TextInputType.visiblePassword) ? true : false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: TextField(
        maxLines: null,
        minLines: 6,
        controller: widget.controller,
        cursorColor: BC.white.withOpacity(0.8),
        style: BS.med18,
        obscureText: isVisible,
        autocorrect: false,
        keyboardType: widget.keyboardType,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          fillColor: BC.white.withOpacity(0.2),
          filled: true,
          suffixIcon: (widget.keyboardType == TextInputType.visiblePassword)
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                    child: Icon(
                        (!isVisible) ? Icons.visibility : Icons.visibility_off,
                        color: BC.white),
                  ),
                )
              : null,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
          enabledBorder: OutlineInputBorder(
            borderRadius: BRadius.r10,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BRadius.r10,
            borderSide: BorderSide(color: BC.green, width: 2),
          ),
          hintText: widget.labelText,
          hintStyle: BS.reg18.apply(color: BC.white.withOpacity(0.7)),
        ),
      ),
    );
  }
}

class CustomTextFieldSend extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? labelText;
  final Function(String) onChanged;
  final Widget? suffixIcon;
  final int? maxLength;

  const CustomTextFieldSend(
      {super.key,
      required this.controller,
      this.keyboardType,
      this.labelText,
      required this.onChanged,
      this.suffixIcon,
      this.maxLength});

  @override
  State<CustomTextFieldSend> createState() => _CustomTextFieldSendState();
}

class _CustomTextFieldSendState extends State<CustomTextFieldSend> {
  bool isVisible = false;

  @override
  void initState() {
    isVisible =
        (widget.keyboardType == TextInputType.visiblePassword) ? true : false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: widget.maxLength,
      buildCounter: (BuildContext context,
              {required int currentLength,
              required int? maxLength,
              required bool isFocused}) =>
          null,
      controller: widget.controller,
      cursorColor: BC.white.withOpacity(0.8),
      style: BS.med18,
      obscureText: isVisible,
      autocorrect: false,
      keyboardType: widget.keyboardType,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        fillColor: BC.white.withOpacity(0.2),
        filled: true,
        suffixIconConstraints: const BoxConstraints(minHeight: 2, minWidth: 50),
        suffixIcon: (widget.suffixIcon != null) ? widget.suffixIcon : null,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
        enabledBorder: OutlineInputBorder(
          borderRadius: BRadius.r10,
          borderSide: BorderSide(color: Colors.transparent, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BRadius.r10,
          borderSide: BorderSide(color: BC.green, width: 1),
        ),
        hintText: widget.labelText,
        hintStyle: BS.reg18.apply(color: BC.white.withOpacity(0.7)),
      ),
    );
  }
}

class CustomTextFieldDialog extends StatelessWidget {
  final String? labelText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final int? maxLength;

  const CustomTextFieldDialog(
      {super.key,
      this.labelText,
      required this.controller,
      this.keyboardType,
      this.maxLength});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 40,
      child: TextField(
        cursorColor: BC.black.withOpacity(0.5),
        cursorRadius: const Radius.circular(10),
        maxLength: maxLength,
        buildCounter: (BuildContext context,
                {required int currentLength,
                required int? maxLength,
                required bool isFocused}) =>
            null,
        controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BRadius.r10,
            borderSide: BorderSide(color: BC.black.withOpacity(0.3), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BRadius.r10,
            borderSide: BorderSide(color: BC.green, width: 1),
          ),
          hintText: labelText,
          hintStyle: BS.light13.apply(color: BC.black),
        ),
      ),
    );
  }
}
