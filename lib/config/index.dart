class LqrConfig {
  static const bool isDebug = true;
  static const double screenWidth = 750;
  static const double screenHeight = 1334;
  static const String savedDir = "/inn/";
  static const String wxAppId = "wxd930ea5d5a258f4f"; //微信appid
  // static const String jiguangAppKey = ""; //极光appkey
  static const String environment = "yapi";
  static const Map<String, Map> envApi = {
    "yapi": {"name": "yapi", "url": "http://yapi.lqrui.cn/mock/60/api/v1"},
    "pro": {"name": "pro环境", "url": "http://218.75.210.249:6007/portal-app/api"},
  };
}
