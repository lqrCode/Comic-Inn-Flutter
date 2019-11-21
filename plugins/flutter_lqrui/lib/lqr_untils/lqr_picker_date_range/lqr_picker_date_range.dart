import 'package:flutter_lqrui/lqr_common/lqr_common.dart';

void lqrPickerDateRange({
  int type = 7,
  LqrPickerDateRangeData selectData,
  Function(LqrPickerDateRangeData) callback,
}) {
  final LqrPickerDateRangeData callbackData = LqrPickerDateRangeData();
  Picker ps = Picker(
    hideHeader: true,
    adapter: DateTimePickerAdapter(
      type: type,
      isNumberMonth: true,
      value: DateTime.fromMicrosecondsSinceEpoch(selectData.startDateMs * 1000),
    ),
    onConfirm: (Picker picker, List value) {
      callbackData.startDateMs = DateUtil.getDateMsByTimeStr((picker.adapter as DateTimePickerAdapter).value.toString());
    },
  );

  Picker pe = Picker(
    hideHeader: true,
    adapter: DateTimePickerAdapter(
      type: type,
      isNumberMonth: true,
      value: DateTime.fromMicrosecondsSinceEpoch(selectData.endDateMs * 1000),
    ),
    onConfirm: (Picker picker, List value) {
      callbackData.endDateMs = DateUtil.getDateMsByTimeStr((picker.adapter as DateTimePickerAdapter).value.toString());
    },
  );

  List<Widget> actions = [
    FlatButton(onPressed: () => Navigator.pop(Lqr.ui.scaffoldCtx), child: Text('取消')),
    FlatButton(
      onPressed: () {
        if (callbackData.startDateMs > callbackData.endDateMs) {
          Lqr.ui.toast("时间区间有误");
          return;
        }
        if (callback != null) callback(callbackData);
        Navigator.pop(Lqr.ui.scaffoldCtx);
      },
      child: Text('确定'),
    )
  ];

  showDialog<Null>(
    context: Lqr.ui.scaffoldCtx,
    builder: (BuildContext parentContext) {
      return AlertDialog(
        title: Text("选择日期范围"),
        actions: actions,
        content: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[Text("开始:"), ps.makePicker(), Text("结束:"), pe.makePicker()],
          ),
        ),
      );
    },
  );
}

class LqrPickerDateRangeData {
  int startDateMs = DateUtil.getNowDateMs();
  int endDateMs = DateUtil.getNowDateMs();
  int maxValue = DateUtil.getNowDateMs() * 4000;
  int minValue = 0;
}
