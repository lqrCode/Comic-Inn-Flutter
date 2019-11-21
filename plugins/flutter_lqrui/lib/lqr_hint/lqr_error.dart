import 'package:flutter_lqrui/lqr_common/lqr_common.dart';

class LqrError extends StatelessWidget {
  final String errorText;

  LqrError({
    Key key,
    this.errorText = '发生错误，请联系开发商',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: Lqr.ui.screenUtil.screenWidth,
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Lqr.ui.iconF(0xe6c1, size: 160, color: Lqr.ui.textC3),
            Container(
              padding: Lqr.ui.edgeT(30),
              child: Text(
                errorText,
                style: TextStyle(color: Lqr.ui.textC3, fontSize: Lqr.ui.size(28)),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
