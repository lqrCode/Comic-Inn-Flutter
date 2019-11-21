import 'package:flutter_lqrui/lqr_common/lqr_common.dart';

class LqrSearch extends StatelessWidget {
  final Function(String) onChanged;
  final Function() onTap;
  final String hintText;
  final bool circle;

  const LqrSearch({
    Key key,
    this.onTap,
    this.onChanged,
    this.hintText,
    this.circle = true, //是否圆形
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: LqrInput(
            height: 60,
            hintText: hintText,
            background: Colors.grey[200],
            circle: circle,
            contentPadding: Lqr.ui.edgeLR(20),
            onChanged: onChanged,
          ),
        ),
        onTap == null
            ? Container()
            : Row(
                children: <Widget>[
                  Container(width: Lqr.ui.width(20)),
                  LqrButton(title: "搜索", width: 120, onTap: onTap, type: LqrButtonType.primary),
                ],
              )
      ],
    );
  }
}
