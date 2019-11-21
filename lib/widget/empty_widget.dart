import 'package:ComicInn/common/common.dart';

class EmptyWidget extends StatelessWidget {
  final String iamge;
  final String name;
  const EmptyWidget({Key key, this.iamge, this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(iamge),
        Container(height: Lqr.ui.width(10)),
        Text('根据上方条件$name', style: TextStyle(color: Lqr.ui.textC2)),
        Container(height: Lqr.ui.width(10)),
        Text('点击搜索可收起展开查询条件', style: TextStyle(color: Lqr.ui.textC3, fontSize: Lqr.ui.size(26))),
      ],
    );
  }
}
