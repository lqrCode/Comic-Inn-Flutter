import 'package:ComicInn/common/common.dart';

import 'package:package_info/package_info.dart';

// Store.value<ConfigProvide>(context).getToken();
class ConfigProvide with ChangeNotifier {
  // 调试开关
  bool isDebug = false;
  Future setIsDebug() async {
    isDebug = !isDebug;
    notifyListeners();
  }

  // 更新
  bool hasAppUpdate = false;
  String newVersion = '1.0.0';

  Future setAppUpdate(bool type, String version) async {
    hasAppUpdate = type;
    newVersion = version;
    notifyListeners();
  }

  // 报错调试
  List debugList = [];

  // 主页底部导航
  int pageIndex = 0;
  Future setPageIndex(int val) async {
    pageIndex = val;
    notifyListeners();
  }

  // 初始化
  String token;
  int initStatus = 0;
  String theme;
  String widgetDebug;
  PackageInfo packageInfo;
  Future initialize() async {
    // await getUserInfo();
    notifyListeners();
  }

  // 切换闪屏
  Future hideSplash() async {
    initStatus = 1;
    notifyListeners();
  }

  // 是否开启页面报错信息
  Future setWidgetDebug(String status) async {
    widgetDebug = status;
    await SpUtil.putString('widgetDebug', status);
    notifyListeners();
  }

  // 主题
  Future setTheme(String val) async {
    theme = val;
    await SpUtil.putString('theme', val);
    notifyListeners();
  }

  // token
  Future setToken(String val) async {
    token = val;
    await SpUtil.putString('token', val);
    notifyListeners();
  }

  // 用户信息
  // UserInfoModel userInfo = UserInfoModel();
  // Future getUserInfo() async {
  //   try {
  //     var res = await lqrHttp(LqrApis.userInfo, "POST");
  //     userInfo = UserInfoModel.fromJson(res.data);
  //     notifyListeners();
  //   } catch (e) {
  //     Lqr.ui.toast(e);
  //   }
  // }
}
