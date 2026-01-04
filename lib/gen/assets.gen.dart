// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Check.svg
  String get check => 'assets/images/Check.svg';

  /// File path: assets/images/Vector.svg
  String get vector => 'assets/images/Vector.svg';

  /// File path: assets/images/app_icon.png
  AssetGenImage get appIcon =>
      const AssetGenImage('assets/images/app_icon.png');

  /// File path: assets/images/edit.svg
  String get edit => 'assets/images/edit.svg';

  /// File path: assets/images/facebook_icon.svg
  String get facebookIcon => 'assets/images/facebook_icon.svg';

  /// File path: assets/images/featured_item_background.svg
  String get featuredItemBackground =>
      'assets/images/featured_item_background.svg';

  /// File path: assets/images/filter.svg
  String get filter => 'assets/images/filter.svg';

  /// File path: assets/images/filter2.svg
  String get filter2 => 'assets/images/filter2.svg';

  /// File path: assets/images/google_icon.svg
  String get googleIcon => 'assets/images/google_icon.svg';

  /// File path: assets/images/location.svg
  String get location => 'assets/images/location.svg';

  /// File path: assets/images/logo.svg
  String get logo => 'assets/images/logo.svg';

  /// File path: assets/images/notification.svg
  String get notification => 'assets/images/notification.svg';

  /// File path: assets/images/page_view_item1_background_image.svg
  String get pageViewItem1BackgroundImage =>
      'assets/images/page_view_item1_background_image.svg';

  /// File path: assets/images/page_view_item1_image.svg
  String get pageViewItem1Image => 'assets/images/page_view_item1_image.svg';

  /// File path: assets/images/page_view_item2_background_image.svg
  String get pageViewItem2BackgroundImage =>
      'assets/images/page_view_item2_background_image.svg';

  /// File path: assets/images/page_view_item2_image.svg
  String get pageViewItem2Image => 'assets/images/page_view_item2_image.svg';

  /// File path: assets/images/plant.svg
  String get plant => 'assets/images/plant.svg';

  /// File path: assets/images/profile_image.png
  AssetGenImage get profileImage =>
      const AssetGenImage('assets/images/profile_image.png');

  /// File path: assets/images/search_icon.svg
  String get searchIcon => 'assets/images/search_icon.svg';

  /// File path: assets/images/splash_bottom.svg
  String get splashBottom => 'assets/images/splash_bottom.svg';

  /// File path: assets/images/trash.svg
  String get trash => 'assets/images/trash.svg';

  /// File path: assets/images/watermelon_test.png
  AssetGenImage get watermelonTest =>
      const AssetGenImage('assets/images/watermelon_test.png');

  /// List of all assets
  List<dynamic> get values => [
    check,
    vector,
    appIcon,
    edit,
    facebookIcon,
    featuredItemBackground,
    filter,
    filter2,
    googleIcon,
    location,
    logo,
    notification,
    pageViewItem1BackgroundImage,
    pageViewItem1Image,
    pageViewItem2BackgroundImage,
    pageViewItem2Image,
    plant,
    profileImage,
    searchIcon,
    splashBottom,
    trash,
    watermelonTest,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

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
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
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

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
