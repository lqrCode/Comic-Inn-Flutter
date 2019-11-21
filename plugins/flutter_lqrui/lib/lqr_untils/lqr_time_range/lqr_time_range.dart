import 'package:flutter_lqrui/lqr_common/lqr_common.dart';

/// start:开始时间;
/// end:结束时间;
/// delimiter:拼接符号;
/// interval:间隔（分钟）;
/// isAstrict:是否按当前时间限制;
/// date:日期，不传默认当天;
List lqrTimeTange({start: "00:00", end: "24:00", delimiter = "-", int interval = 30, isAstrict = false, date = "0000-00-00"}) {
  List<LqrDialogSelectListsModel> data = [];
  String timeStr = start;

// 补位，是否在后面
  funa(num numa, {isLast = false}) {
    return numa.toString().length == 2 ? numa : (isLast ? numa.toString() + '0' : '0' + numa.toString());
  }

// 开始时间转分钟
  var a = start.split(":");
  a = (int.parse(a[0]) == 0 ? 0 : int.parse(a[0]) * 60) + int.parse(a[1]);
  // print('+++++++++++++++++a:$a');

// 结束时间转分钟
  var b = end.split(":");
  b = (int.parse(b[0]) == 0 ? 0 : int.parse(b[0]) * 60) + int.parse(b[1]);
  // print('+++++++++++++++++b:$b');

// 限制
  if (isAstrict) {
    var today = DateTime.now();
    // (当前分钟 / 间隔).向上取整 * 间隔
    var c = ((today.hour * 60 + today.minute) / interval).ceil() * interval;
    //当前时间大于开始时间
    if (c > a) {
      a = a > c ? a : c;
      if (date != '${today.year}-${funa(today.month)}-${funa(today.day)}')
        a = 0;
      else
        timeStr = '${funa(c ~/ 60)}:${funa((c % 60), isLast: true)}';
    }
    // print('+++++++++++++++++c:$c');
  }

// 需要循环次数
  int numa = (b - a) ~/ interval;
  // print('+++++++++++++++++循环次数:$numa');

  for (var i = 0; i < numa; i++) {
    var hour = (a + interval) ~/ 60;
    var minute = (a + interval) % 60;
    var time = '${funa(hour)}:${funa(minute, isLast: true)}';
    data.add(LqrDialogSelectListsModel(name: timeStr + delimiter + time, value: timeStr + delimiter + time));
    timeStr = time;
    a += interval;
  }
  
  return data;
}
