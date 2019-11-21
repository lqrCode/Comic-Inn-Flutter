import 'package:flutter_lqrui/lqr_common/lqr_common.dart';

class LqrLineText extends StatelessWidget {
  final List<LqrLineTextData> lists;
  final LqrLineTextData data;
  final TextStyle lstyle;
  final TextStyle rstyle;
  const LqrLineText({Key key, this.lists, this.data, this.lstyle, this.rstyle}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return data != null ? page(data): Row(
      children: lists.map((v) => Expanded(flex: 1, child: page(v))).toList(),
    );
  }

  Widget page(v) {
    return Row(
      children: <Widget>[
        Text(v.title, style: lstyle ?? TextStyle(color: Lqr.ui.textC2, fontSize: Lqr.ui.size(28))),
        Text('  '),
        Expanded(
          child: Container(
            alignment: Alignment.centerLeft,
            child: v.widget ?? Text(v.value ?? '', style: rstyle ?? TextStyle(color: Lqr.ui.textC3, fontSize: Lqr.ui.size(28)), maxLines: 1),
          ),
        ),
      ],
    );
  }
}

class LqrLineTextData {
  final String title;
  final String value;
  final Widget widget;
  LqrLineTextData({this.title, this.value, this.widget});
}
