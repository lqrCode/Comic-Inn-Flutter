import 'package:flutter_lqrui/lqr_common/lqr_common.dart';

class LqrToast {
  toast(text) => Fluttertoast.showToast(
        msg: '$text',
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        textColor: Colors.white,
        fontSize: Lqr.ui.width(24),
        backgroundColor: Lqr.ui.textC3,
      );
}
