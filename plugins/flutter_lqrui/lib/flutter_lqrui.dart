import './lqr_common/lqr_common.dart';
export './lqr_common/lqr_common.dart';

import './lqr_untils/untils/format_date.dart';
import './lqr_untils/untils/box_shadow.dart';
import './lqr_untils/untils/edge_insets.dart';
import './lqr_untils/untils/border.dart';
import './lqr_untils/untils/toast.dart';
import './lqr_untils/untils/loading.dart';

class Lqr extends LqrDateTime with LqrBoxShadow, LqrEdgeInsets, LqrBorder, LqrToast, LqrLoading {
  static Lqr ui = new Lqr();
  BuildContext scaffoldCtx;
  double screenWidth;
  double screenHeight;

// ++++++++++++++++++++++++++++++++++++++++颜色++++++++++++++++++++++++++++++++++++++++
  /// 主要颜色 int
  int primaryColor;

  /// 主要颜色 color
  Color get primaryC => Color(primaryColor);

  /// 背景颜色 int
  int backgroundColor;

  /// 背景颜色 color
  Color get backgroundC => Color(backgroundColor);

  /// 辅助色 Success int
  int successColor;

  /// 辅助色 Success color
  Color get successC => Color(successColor);

  /// 辅助色 Warning int
  int warningColor;

  /// 辅助色Warning color
  Color get warningC => Color(warningColor);

  /// 辅助色 Danger int
  int dangerColor;

  /// 辅助色 Danger color
  Color get dangerC => Color(dangerColor);

  /// 辅助色 Info int
  int infoColor;

  /// 辅助色 Info color
  Color get infoC => Color(infoColor);
// ++++++++++++++++++++++++++++++++++++++++颜色++++++++++++++++++++++++++++++++++++++++

// ++++++++++++++++++++++++++++++++++++++++padding边距++++++++++++++++++++++++++++++++++++++++
  /// 基础边距
  double edgeBa;
// ++++++++++++++++++++++++++++++++++++++++padding边距++++++++++++++++++++++++++++++++++++++++

// ++++++++++++++++++++++++++++++++++++++++padding边距++++++++++++++++++++++++++++++++++++++++
  /// 基础圆角
  double radius;
// ++++++++++++++++++++++++++++++++++++++++padding边距++++++++++++++++++++++++++++++++++++++++

// ++++++++++++++++++++++++++++++++++++++++字体颜色++++++++++++++++++++++++++++++++++++++++
  /// 主要文字 Primary Text
  int textColor1;

  /// 主要文字 Primary Text
  Color get textC1 => Color(textColor1);

  /// 常规文字 Regular Text
  int textColor2;

  /// 常规文字 Regular Text
  Color get textC2 => Color(textColor2);

  /// 次要文字 Secondary Text
  int textColor3;

  /// 次要文字 Secondary Text
  Color get textC3 => Color(textColor3);

  /// 占位文字 Placeholder Text
  int textColor4;

  /// 占位文字 Placeholder Text
  Color get textC4 => Color(textColor4);
// ++++++++++++++++++++++++++++++++++++++++字体颜色++++++++++++++++++++++++++++++++++++++++

// ++++++++++++++++++++++++++++++++++++++++边框颜色++++++++++++++++++++++++++++++++++++++++
  ///一级边框 Border Base
  int dividerColor1;

  ///一级边框 Border Base
  Color get dividerC1 => Color(dividerColor1);

  ///二级边框 Border Light
  int dividerColor2;

  ///二级边框 Border Light
  Color get dividerC2 => Color(dividerColor2);

  ///三级边框 Border Lighter
  int dividerColor3;

  ///三级边框 Border Lighter
  Color get dividerC3 => Color(dividerColor3);

  ///四级边框 Border Extralight
  int dividerColor4;

  ///四级边框 Border Extralight
  Color get dividerC4 => Color(dividerColor4);
// ++++++++++++++++++++++++++++++++++++++++边框颜色++++++++++++++++++++++++++++++++++++++++

  Lqr({
    this.scaffoldCtx,
    this.screenWidth = 750,
    this.screenHeight = 1334,
    // 颜色
    this.primaryColor = 0xFF409EFF,
    this.backgroundColor = 0xFFF5F7FA,
    this.successColor = 0xFF67C23A,
    this.warningColor = 0xFFE6A23C,
    this.dangerColor = 0xFFF56C6C,
    this.infoColor = 0xFF909399,
    // 边距
    this.edgeBa = 20,
    // 圆角
    this.radius = 10,
    // 字体颜色
    this.textColor1 = 0xFF303133,
    this.textColor2 = 0xFF606266,
    this.textColor3 = 0xFF909399,
    this.textColor4 = 0xFFC0C4CC,
    // 边框颜色
    this.dividerColor1 = 0xFFDCDFE6,
    this.dividerColor2 = 0xFFE4E7ED,
    this.dividerColor3 = 0xFFEBEEF5,
    this.dividerColor4 = 0xFFF2F6FC,
  });

  void init(BuildContext context) {
    // MediaQuery.of(context);
    setDesignWHD(screenWidth, screenHeight, density: 3);
    // ScreenUtil.instance = ScreenUtil(width: screenWidth, height: screenHeight)..init(context);
  }

  double size(double style) => ScreenUtil.getInstance().getAdapterSize(style);
  double width(double style) => ScreenUtil.getInstance().getAdapterSize(style);
  double height(double style) => ScreenUtil.getInstance().getAdapterSize(style);

  intervalWidget({double height}) => Container(height: this.height(height ?? 13), color: Color(0xfff4f5f7));
  dividerWidget() => Divider(height: this.width(1), color: Lqr.ui.dividerC1, thickness: 0.9);

  icon(path, {double size = 25, Color color}) => Icon(IconData(path, fontFamily: 'IconFont'), size: this.size(size), color: color);
  iconF(path, {double size = 25, Color color}) => Icon(IconData(path, fontFamily: 'LqrFlutter'), size: this.size(size), color: color);

  argbTo16(color) => Color(int.parse(color.substring(1, 9), radix: 16) + 0xFF000000);

  ScreenUtil get screenUtil => ScreenUtil.getInstance();
}

class FlutterLqrui {
  static const MethodChannel _channel = const MethodChannel('flutter_lqrui');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
