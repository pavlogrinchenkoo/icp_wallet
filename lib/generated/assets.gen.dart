/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/Union.svg
  SvgGenImage get union => const SvgGenImage('assets/icons/Union.svg');

  /// File path: assets/icons/Union_green.svg
  SvgGenImage get unionGreen =>
      const SvgGenImage('assets/icons/Union_green.svg');

  /// File path: assets/icons/copy.svg
  SvgGenImage get copy => const SvgGenImage('assets/icons/copy.svg');

  /// File path: assets/icons/copy_green.svg
  SvgGenImage get copyGreen => const SvgGenImage('assets/icons/copy_green.svg');

  /// File path: assets/icons/copy_w.svg
  SvgGenImage get copyW => const SvgGenImage('assets/icons/copy_w.svg');

  /// File path: assets/icons/down.svg
  SvgGenImage get down => const SvgGenImage('assets/icons/down.svg');

  /// File path: assets/icons/edit.svg
  SvgGenImage get edit => const SvgGenImage('assets/icons/edit.svg');

  /// File path: assets/icons/edit_green.svg
  SvgGenImage get editGreen => const SvgGenImage('assets/icons/edit_green.svg');

  /// File path: assets/icons/group.svg
  SvgGenImage get group => const SvgGenImage('assets/icons/group.svg');

  /// File path: assets/icons/logo.svg
  SvgGenImage get logo => const SvgGenImage('assets/icons/logo.svg');

  /// File path: assets/icons/logout.svg
  SvgGenImage get logout => const SvgGenImage('assets/icons/logout.svg');

  /// File path: assets/icons/logout_green.svg
  SvgGenImage get logoutGreen =>
      const SvgGenImage('assets/icons/logout_green.svg');

  /// File path: assets/icons/person Ball.svg
  SvgGenImage get personBall =>
      const SvgGenImage('assets/icons/person Ball.svg');

  /// File path: assets/icons/person.svg
  SvgGenImage get person => const SvgGenImage('assets/icons/person.svg');

  /// File path: assets/icons/remuwe.svg
  SvgGenImage get remuwe => const SvgGenImage('assets/icons/remuwe.svg');

  /// File path: assets/icons/up.svg
  SvgGenImage get up => const SvgGenImage('assets/icons/up.svg');

  /// File path: assets/icons/user-circle.svg
  SvgGenImage get userCircle =>
      const SvgGenImage('assets/icons/user-circle.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        union,
        unionGreen,
        copy,
        copyGreen,
        copyW,
        down,
        edit,
        editGreen,
        group,
        logo,
        logout,
        logoutGreen,
        personBall,
        person,
        remuwe,
        up,
        userCircle
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/bagraund.png
  AssetGenImage get bagraund =>
      const AssetGenImage('assets/images/bagraund.png');

  /// File path: assets/images/banck.png
  AssetGenImage get banck => const AssetGenImage('assets/images/banck.png');

  /// File path: assets/images/fon.png
  AssetGenImage get fon => const AssetGenImage('assets/images/fon.png');

  /// File path: assets/images/phone.png
  AssetGenImage get phone => const AssetGenImage('assets/images/phone.png');

  /// File path: assets/images/qrcode1.png
  AssetGenImage get qrcode1 => const AssetGenImage('assets/images/qrcode1.png');

  /// File path: assets/images/qrcode2.png
  AssetGenImage get qrcode2 => const AssetGenImage('assets/images/qrcode2.png');

  /// File path: assets/images/qrcode3.png
  AssetGenImage get qrcode3 => const AssetGenImage('assets/images/qrcode3.png');

  /// File path: assets/images/trafik.png
  AssetGenImage get trafik => const AssetGenImage('assets/images/trafik.png');

  /// File path: assets/images/wallet.png
  AssetGenImage get wallet => const AssetGenImage('assets/images/wallet.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [bagraund, banck, fon, phone, qrcode1, qrcode2, qrcode3, trafik, wallet];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
