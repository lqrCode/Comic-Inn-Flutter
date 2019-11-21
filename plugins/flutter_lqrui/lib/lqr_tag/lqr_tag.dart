import 'package:flutter_lqrui/lqr_common/lqr_common.dart';

class LqrTag extends StatelessWidget {
  final String value;
  final Map type; //类型
  final bool hit; //是否有边框描边
  final Color textC;
  final Color background;
  const LqrTag({
    Key key,
    this.type,
    this.value = '',
    this.hit = false,
    this.textC,
    this.background,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Lqr.ui.edgeH(style: 10, top: 5, bottom: 5),
      decoration: BoxDecoration(color: background ?? Color(type['background']), borderRadius: Lqr.ui.borderRadius()),
      child: Text(value, style: TextStyle(color: textC ?? Color(type['textC']), fontSize: Lqr.ui.size(24))),
    );
  }
}

class LqrTagType {
  static Map success = {"textC": 0xff67c23a, "background": 0xfff0f9eb};
  static Map info = {"textC": 0xff909399, "background": 0xfff4f4f};
  static Map warning = {"textC": 0xffe6a23c, "background": 0xfffdf6ec};
  static Map danger = {"textC": 0xfff56c6c, "background": 0xfffef0f0};
}
