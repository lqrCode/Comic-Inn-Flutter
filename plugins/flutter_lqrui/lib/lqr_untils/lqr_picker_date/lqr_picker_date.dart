import 'package:flutter_lqrui/lqr_common/lqr_common.dart';

/// kMDY = 0; // m, d, y;
/// kHM = 1; // hh, mm;
/// kHMS = 2; // hh, mm, ss;
/// kHM_AP = 3; // hh, mm, ap(AM/PM);
/// kMDYHM = 4; // m, d, y, hh, mm;
/// kMDYHM_AP = 5; // m, d, y, hh, mm, AM/PM;
/// kMDYHMS = 6; // m, d, y, hh, mm, ss;
/// static const int kYMD = 7; // y, m, d;
/// static const int kYMDHM = 8; // y, m, d, hh, mm;
/// static const int kYMDHMS = 9; // y, m, d, hh, mm, ss;
/// static const int kYMD_AP_HM = 10; // y, m, d, ap, hh, mm;
/// static const int kYM = 11; // y, m;
/// static const int kDMY = 12; // d, m, y;
/// kYMD_AP = 13; // y, m, d, ap;

showPickerDateTime({
  int type,
  int maxMs = 0,
  int minMs,
  int valMs,
  Function(int val) callBack,
}) {
  Picker(
    hideHeader: true,
    adapter: DateTimePickerAdapter(
      type: type,
      maxValue: timeMs(maxMs),
      minValue: timeMs(minMs),
      isNumberMonth: true,
      value: timeMs(valMs),
    ),
    title: Text("选择时间"),
    onConfirm: (Picker picker, List value) {
      int timeDateMs = DateUtil.getDateMsByTimeStr((picker.adapter as DateTimePickerAdapter).value.toString());
      callBack(timeDateMs);
    },
  ).showDialog(Lqr.ui.scaffoldCtx);
}

DateTime timeMs(int ms) {
  return ms == 0
      ? null
      : DateTime.fromMicrosecondsSinceEpoch(
          ms == null ? DateUtil.getNowDateMs() * 1000 : ms * 1000,
        );
}
