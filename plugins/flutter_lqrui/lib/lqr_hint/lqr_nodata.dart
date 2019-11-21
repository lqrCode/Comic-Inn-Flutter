import 'package:flutter_lqrui/lqr_common/lqr_common.dart';

class LqrNoData extends StatelessWidget {
  final double height;
  final String btnText;
  final Function() onclick;
  final String showText;
  final Color bgColor;
  const LqrNoData({
    Key key,
    this.bgColor,
    this.height,
    this.btnText = "点击了解更多",
    this.onclick,
    this.showText = '暂无数据~',
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? Lqr.ui.height(Lqr.ui.screenHeight - 180),
      color: bgColor ?? null,
      width: Lqr.ui.screenUtil.screenWidth,
      child: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/images/no_data.png', width: Lqr.ui.width(230), fit: BoxFit.fitWidth),
          Container(
            padding: Lqr.ui.edge(top: 50),
            child: Text(showText, style: TextStyle(color: Theme.of(context).primaryColor, fontSize: Lqr.ui.size(28))),
          ),
          onclick == null ? Container() : LqrButton(title: btnText ?? '', margin: Lqr.ui.edgeT(30), width: 300, onTap: onclick),
        ],
      ),
    );
  }
}
