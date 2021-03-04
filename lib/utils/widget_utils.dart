import 'dart:io';
import 'dart:typed_data';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class Joho {
  static CupertinoButton onClickBtn({
    Key key,
    @required Widget child,
    EdgeInsetsGeometry padding = EdgeInsets.zero,
    Color color,
    Color disabledColor = CupertinoColors.quaternarySystemFill,
    double minSize = 0,
    double pressedOpacity = 0.4,
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(0)),
    @required VoidCallback onPressed,
  }) {
    return CupertinoButton(
      key: key,
      child: child,
      padding: padding,
      color: color,
      disabledColor: disabledColor,
      minSize: minSize,
      pressedOpacity: pressedOpacity,
      borderRadius: borderRadius,
      onPressed: onPressed,
    );
  }

  static ExtendedAssetImageProvider assetImageProvider(
    String assetName, {
    AssetBundle bundle,
    String package,
  }) {
    return ExtendedAssetImageProvider(
      assetName,
      bundle: bundle,
      package: package,
    );
  }

  static ExtendedFileImageProvider fileImageProvider(
    File file, {
    double scale = 1.0,
  }) {
    return ExtendedFileImageProvider(
      file,
      scale: scale,
    );
  }

  static ExtendedMemoryImageProvider memoryImageProvider(
    Uint8List bytes, {
    double scale = 1.0,
  }) {
    return ExtendedMemoryImageProvider(
      bytes,
      scale: scale,
    );
  }

  static ExtendedNetworkImageProvider networkImageProvider(
    String url, {
    double scale = 1.0,
    Map<String, String> headers,
    bool cache = true,
    int retries = 3,
    Duration timeLimit,
    Duration timeRetry = const Duration(milliseconds: 100),
  }) {
    return ExtendedNetworkImageProvider(
      url,
      scale: scale,
      headers: headers,
      cache: cache,
      retries: retries,
      timeLimit: timeLimit,
      timeRetry: timeRetry,
    );
  }

  static ExtendedImage image({
    Key key,
    @required ImageProvider image,
    String semanticLabel,
    bool excludeFromSemantics = false,
    double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit = BoxFit.contain,
    Alignment alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    FilterQuality filterQuality = FilterQuality.low,
    LoadStateChanged loadStateChanged,
    BoxBorder border,
    BoxShape shape,
    BorderRadius borderRadius,
    Clip clipBehavior = Clip.antiAlias,
    bool enableLoadState = false,
    BeforePaintImage beforePaintImage,
    AfterPaintImage afterPaintImage,
    ExtendedImageMode mode = ExtendedImageMode.none,
    bool enableMemoryCache = true,
    bool clearMemoryCacheIfFailed = true,
    DoubleTap onDoubleTap,
    InitGestureConfigHandler initGestureConfigHandler,
    bool enableSlideOutPage = false,
    BoxConstraints constraints,
    extendedImageEditorKey,
    InitEditorConfigHandler initEditorConfigHandler,
    HeroBuilderForSlidingPage heroBuilderForSlidingPage,
    bool clearMemoryCacheWhenDispose = false,
    Key extendedImageGestureKey,
  }) {
    return ExtendedImage(
      key: key,
      image: image,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      filterQuality: filterQuality,
      loadStateChanged: loadStateChanged,
      border: border,
      shape: shape,
      borderRadius: borderRadius,
      clipBehavior: clipBehavior,
      enableLoadState: enableLoadState,
      beforePaintImage: beforePaintImage,
      afterPaintImage: afterPaintImage,
      mode: mode,
      enableMemoryCache: enableMemoryCache,
      clearMemoryCacheIfFailed: clearMemoryCacheIfFailed,
      onDoubleTap: onDoubleTap,
      initGestureConfigHandler: initGestureConfigHandler,
      enableSlideOutPage: enableSlideOutPage,
      constraints: constraints,
      extendedImageEditorKey: extendedImageEditorKey,
      initEditorConfigHandler: initEditorConfigHandler,
      heroBuilderForSlidingPage: heroBuilderForSlidingPage,
      clearMemoryCacheWhenDispose: clearMemoryCacheWhenDispose,
      extendedImageGestureKey: extendedImageGestureKey,
    );
  }

  static checkBoxIcon(
    bool isChecked, {
    double size,
    Color color,
  }) {
    final iconData =
        isChecked ? CupertinoIcons.check_mark_circled : CupertinoIcons.circle;

    return Icon(
      iconData,
      size: size,
      color: color,
    );
  }
}
