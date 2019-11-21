import 'package:flutter_lqrui/lqr_common/lqr_common.dart';

class LqrIcon {
  /// 加载
  static int loading = 0xe60a;
}

class LoadingIcon extends StatefulWidget {
  const LoadingIcon({Key key}) : super(key: key);
  @override
  _LoadingIconState createState() => _LoadingIconState();
}

class _LoadingIconState extends State<LoadingIcon> with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RotationTransition(
        //设置动画的旋转中心
        alignment: Alignment.center,
        //动画控制器
        turns: controller,
        //将要执行动画的子view
        child: Container(
          width: 100,
          height: 100,
          color: Colors.grey,
        ),
      ),
    );
  }
}
