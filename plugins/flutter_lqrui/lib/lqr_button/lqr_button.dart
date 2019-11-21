import 'package:flutter_lqrui/lqr_common/lqr_common.dart';

class LqrButton extends StatelessWidget {
  final Function() onTap;

  final String title;
  final EdgeInsetsGeometry margin;
  final double width;
  final double height;
  final double textSize;
  final int color;
  final LqrButtonTypeClass type;
  final bool plain;
  final double round;
  final bool circle;
  final double elevation;
  final double highlightElevation;
  final double disabledElevation;
  final LqrButtonSizeClass size;

  const LqrButton({
    this.onTap, //为null时禁用状态
    Key key,
    this.title,
    this.margin = EdgeInsets.zero,
    this.width,
    this.height,
    this.textSize = 27,
    this.color,
    this.type = LqrButtonType.defaul, //类型
    this.plain = false, //是否朴素按钮
    this.round = 10, //圆角按钮
    this.circle = false, //是否圆形按钮
    this.elevation = 0.0, //正常状态下的阴影
    this.highlightElevation = 0.0, //按下时的阴影
    this.disabledElevation = 0.0, // 禁用时的阴影
    this.size = LqrButtonSize.big, //尺寸
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Lqr.ui.width(width ?? size.width),
      height: Lqr.ui.height(height ?? size.height),
      margin: margin,
      child: RaisedButton(
        color: plain ? Color(color ?? type.lcolor) : Color(color ?? type.pcolor),
        padding: EdgeInsets.zero,
        elevation: elevation,
        highlightElevation: highlightElevation,
        disabledElevation: disabledElevation,
        child: Text(title, style: TextStyle(fontSize: Lqr.ui.size(textSize))),
        textColor: plain ? Color(type.pcolor) : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Lqr.ui.width(circle ? height ?? size.height : round)),
          side: plain ? BorderSide(width: 1, color: Color(type.bcolor)) : BorderSide.none,
        ),
        onPressed: onTap,
      ),
    );
  }
}

class LqrButtonType {
  // default英文报错，所以少个t[捂脸哭]
  static const LqrButtonTypeClass defaul = LqrButtonTypeClass(pcolor: 0xFF606266, lcolor: 0xFFffffff, bcolor: 0xFFdcdfe6);
  static const LqrButtonTypeClass primary = LqrButtonTypeClass(pcolor: 0xFF409eff, lcolor: 0xFFecf5ff, bcolor: 0xFFb3d8ff);
  static const LqrButtonTypeClass success = LqrButtonTypeClass(pcolor: 0xFF67c23a, lcolor: 0xFFf0f9eb, bcolor: 0xFFc2e7b0);
  static const LqrButtonTypeClass info = LqrButtonTypeClass(pcolor: 0xFF909399, lcolor: 0xFFf4f4f5, bcolor: 0xFFd3d4d6);
  static const LqrButtonTypeClass warning = LqrButtonTypeClass(pcolor: 0xFFe6a23c, lcolor: 0xFFfdf6ec, bcolor: 0xFFf5dab1);
  static const LqrButtonTypeClass danger = LqrButtonTypeClass(pcolor: 0xFFf56c6c, lcolor: 0xFFfef0f0, bcolor: 0xFFfbc4c4);
}

class LqrButtonTypeClass {
  final int pcolor;
  final int lcolor;
  final int bcolor;
  const LqrButtonTypeClass({this.pcolor, this.lcolor, this.bcolor});
}

class LqrButtonSize {
  static const LqrButtonSizeClass medium = LqrButtonSizeClass(width: 98, height: 36);
  static const LqrButtonSizeClass small = LqrButtonSizeClass(width: 160, height: 60);
  static const LqrButtonSizeClass mini = LqrButtonSizeClass(width: 140, height: 55);
  static const LqrButtonSizeClass big = LqrButtonSizeClass(width: 512, height: 76);
}

class LqrButtonSizeClass {
  final double width;
  final double height;
  const LqrButtonSizeClass({this.width, this.height});
}
