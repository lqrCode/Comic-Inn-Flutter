import 'package:flutter_lqrui/lqr_common/lqr_common.dart';

class LqrCard extends StatelessWidget {
  final Function() onTap;
  final Widget hearder;
  final double hearderHeight;
  final Widget content;
  final EdgeInsetsGeometry margin;
  const LqrCard({
    Key key,
    this.onTap,
    this.hearder,
    this.hearderHeight = 68,
    this.content,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin,
        decoration: BoxDecoration(borderRadius: Lqr.ui.borderRadius(), color: Colors.white, boxShadow: Lqr.ui.boxShadow),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            hearder != null ? Container(height: Lqr.ui.width(hearderHeight), padding: Lqr.ui.edgeLR(Lqr.ui.edgeBa), child: hearder, alignment: Alignment.centerLeft) : Container(),
            hearder != null && content != null ? Lqr.ui.dividerWidget() : Container(),
            content != null ? Container(padding: Lqr.ui.edgeA(Lqr.ui.edgeBa), child: content) : Container(),
          ],
        ),
      ),
    );
  }
}
