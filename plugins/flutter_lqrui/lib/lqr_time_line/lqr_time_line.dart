import 'package:flutter_lqrui/lqr_common/lqr_common.dart';

class LqrTimeLine extends StatelessWidget {
  final Widget title;
  final Widget content;
  const LqrTimeLine({Key key, this.title, this.content}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[page()]),
    );
  }

  Widget page() {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            ClipOval(
              child: Container(
                width: Lqr.ui.width(15),
                height: Lqr.ui.width(15),
                alignment: Alignment.center,
                color: Lqr.ui.primaryC,
                child: Text("", style: TextStyle(fontSize: Lqr.ui.size(12), color: Colors.white)),
              ),
            ),
            Expanded(child: Container(margin: Lqr.ui.edgeL(10), child: title)),
          ],
        ),
        Container(
          width: Lqr.ui.screenUtil.screenWidth,
          padding: Lqr.ui.edgeH(style: 20, left: 30),
          margin: Lqr.ui.edgeLR(7),
          decoration: BoxDecoration(
            border: Lqr.ui.border(left: 1),
          ),
          child: Container(child: content),
        ),
      ],
    );
  }
}
