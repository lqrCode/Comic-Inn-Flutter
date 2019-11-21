import 'package:flutter_lqrui/lqr_common/lqr_common.dart';

class LqrBorder {
  borderRadius({double style}) => BorderRadius.circular(Lqr.ui.width(style ?? Lqr.ui.radius));
  borderRadiusT({double style}) => BorderRadius.vertical(top: Radius.circular(Lqr.ui.width(style ?? Lqr.ui.radius)));
  borderRadiusB({double style}) => BorderRadius.vertical(bottom: Radius.circular(Lqr.ui.width(style ?? Lqr.ui.radius)));
  border({double left = 0, double top = 0, double right = 0, double bottom = 0}) => Border(
        left: left == 0 ? BorderSide.none : BorderSide(width: Lqr.ui.width(left), color: Lqr.ui.dividerC1),
        top: top == 0 ? BorderSide.none : BorderSide(width: Lqr.ui.width(top), color: Lqr.ui.dividerC1),
        right: right == 0 ? BorderSide.none : BorderSide(width: Lqr.ui.width(right), color: Lqr.ui.dividerC1),
        bottom: bottom == 0 ? BorderSide.none : BorderSide(width: Lqr.ui.width(bottom), color: Lqr.ui.dividerC1),
      );
  borderA(double width, {Color color}) => Border.all(width: Lqr.ui.width(width), color: color ?? Lqr.ui.dividerC1);
}
