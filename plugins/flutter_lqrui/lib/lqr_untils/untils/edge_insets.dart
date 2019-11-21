import 'package:flutter_lqrui/lqr_common/lqr_common.dart';

class LqrEdgeInsets {
  EdgeInsetsGeometry edge({double left, double top, double right, double bottom}) => EdgeInsets.fromLTRB(left == null ? 0.0 : Lqr.ui.width(left), top == null ? 0.0 : Lqr.ui.width(top), right == null ? 0.0 : Lqr.ui.width(right), bottom == null ? 0.0 : Lqr.ui.width(bottom));
  EdgeInsetsGeometry edgeA(double style) => EdgeInsets.all(Lqr.ui.width(style));
  EdgeInsetsGeometry edgeH({double style, double left, double top, double right, double bottom, double tb, double lr}) => EdgeInsets.fromLTRB(
        Lqr.ui.width(lr ?? style ?? left),
        Lqr.ui.width(tb ?? style ?? top),
        Lqr.ui.width(lr ?? style ?? right),
        Lqr.ui.width(tb ?? style ?? bottom),
      );
  EdgeInsetsGeometry edgeLR(double style) => EdgeInsets.fromLTRB(Lqr.ui.width(style), 0.0, Lqr.ui.width(style), 0.0);
  EdgeInsetsGeometry edgeTB(double style) => EdgeInsets.fromLTRB(
        0.0,
        Lqr.ui.width(style),
        0.0,
        Lqr.ui.width(style),
      );
  EdgeInsetsGeometry edgeL(double style) => EdgeInsets.only(left: Lqr.ui.width(style));
  EdgeInsetsGeometry edgeT(double style) => EdgeInsets.only(top: Lqr.ui.width(style));
  EdgeInsetsGeometry edgeR(double style) => EdgeInsets.only(right: Lqr.ui.width(style));
  EdgeInsetsGeometry edgeB(double style) => EdgeInsets.only(bottom: Lqr.ui.width(style));
}
