import 'package:ComicInn/common/common.dart';

Future lqrRouter(path, {data, maintainState: true}) async {
  print('$path');
  return await Navigator.push(Store.scaffoldCtx, AnimationRoute(path, maintainState));
}

class AnimationRoute extends PageRouteBuilder {
  final Widget widget;
  final bool maintainState;
  AnimationRoute(this.widget, this.maintainState)
      : super(
          transitionDuration: const Duration(milliseconds: 300), //设置动画时长500毫秒
          pageBuilder: (BuildContext context, Animation<double> animation1, Animation<double> animation2) {
            return widget;
          },
          maintainState: maintainState,
          transitionsBuilder: (BuildContext context, Animation<double> animation1, Animation<double> animation2, Widget child) {
            return SlideTransition(
              position: Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0)).animate(CurvedAnimation(parent: animation1, curve: Curves.fastOutSlowIn)),
              child: child,
            );
          },
        );
}
