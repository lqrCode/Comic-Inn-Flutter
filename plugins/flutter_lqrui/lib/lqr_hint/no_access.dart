import 'package:flutter/widgets.dart';
import 'package:flutter_lqrui/lqr_common/lqr_common.dart';

class NoAccess extends StatefulWidget {
  final params;
  NoAccess({Key key, this.params}) : super(key: key);
  @override
  _NoAccessState createState() => _NoAccessState();
}

class _NoAccessState extends State<NoAccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('权限不足'), elevation: 0),
      body: Container(
        width: Lqr.ui.screenUtil.screenWidth,
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Lqr.ui.icon(0xe65f, color: Lqr.ui.textC2, size: 160),
            Container(
              padding: Lqr.ui.edgeTB(50),
              margin: Lqr.ui.edgeLR(160),
              child: Text(
                '此功能为企业管理员专享功能，需要加入企业，并由企业管理人授权',
                style: TextStyle(color: Lqr.ui.textC2, fontSize: Lqr.ui.size(26)),
                textAlign: TextAlign.center,
              ),
            ),
            // Lqr.ui.button('马上绑定', width: 250, ontap: () => lqrRouter(context, Routes.companySearch())),
          ],
        ),
      ),
    );
  }
}
