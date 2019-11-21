import 'package:flutter_lqrui/lqr_common/lqr_common.dart';

class LqrLoading {
  loading() => showDialog(
        context: Lqr.ui.scaffoldCtx,
        builder: (context) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  SizedBox(height: 10),
                  Text('加载中...', style: TextStyle(color: Colors.white70)),
                ],
              ),
            ),
          );
        },
      );
}
