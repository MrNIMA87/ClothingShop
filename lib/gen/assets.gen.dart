/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/dress.png
  AssetGenImage get dress => const AssetGenImage('assets/icons/dress.png');

  /// File path: assets/icons/jacket.png
  AssetGenImage get jacket => const AssetGenImage('assets/icons/jacket.png');

  /// File path: assets/icons/pant.png
  AssetGenImage get pant => const AssetGenImage('assets/icons/pant.png');

  /// File path: assets/icons/search.svg
  String get search => 'assets/icons/search.svg';

  /// File path: assets/icons/t-shirt.png
  AssetGenImage get tShirt => const AssetGenImage('assets/icons/t-shirt.png');

  /// List of all assets
  List<dynamic> get values => [dress, jacket, pant, search, tShirt];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/bannerSlider2.jpg
  AssetGenImage get bannerSlider2 =>
      const AssetGenImage('assets/images/bannerSlider2.jpg');

  /// File path: assets/images/bannerSlider3.jpg
  AssetGenImage get bannerSlider3 =>
      const AssetGenImage('assets/images/bannerSlider3.jpg');

  /// File path: assets/images/splash.png
  AssetGenImage get splash => const AssetGenImage('assets/images/splash.png');

  /// File path: assets/images/welcome_1.png
  AssetGenImage get welcome1 =>
      const AssetGenImage('assets/images/welcome_1.png');

  /// File path: assets/images/welcome_2.png
  AssetGenImage get welcome2 =>
      const AssetGenImage('assets/images/welcome_2.png');

  /// File path: assets/images/welcome_3.png
  AssetGenImage get welcome3 =>
      const AssetGenImage('assets/images/welcome_3.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [bannerSlider2, bannerSlider3, splash, welcome1, welcome2, welcome3];
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
