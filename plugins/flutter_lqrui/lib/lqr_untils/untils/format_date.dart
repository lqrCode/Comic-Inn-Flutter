import 'package:flutter_lqrui/lqr_common/lqr_common.dart';

class LqrDateTime {
  formatDateMs(int val, {String format}) => DateUtil.formatDateMs(val, format: format ?? "yyyy-M-d HH:mm:ss");
}
