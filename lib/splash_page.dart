import 'package:ComicInn/common/common.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    countDown();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Lqr.ui.height(0.1),
      child: Image.asset("assets/images/splash_bg.png", fit: BoxFit.fill),
    );
  }

  void countDown() {
    Future.delayed(Duration(seconds: 1), go2HomePage);
  }

  void go2HomePage() async {
    String a = Store.value<ConfigProvide>(Store.storeCtx).token;
    if (a != '0') await Store.value<ConfigProvide>(Store.storeCtx).initialize();
    Store.value<ConfigProvide>(Store.storeCtx).hideSplash();
  }
}
