import 'package:ComicInn/common/common.dart';

Map materialColor = {
  'qixiManage': {
    "primaryColor": 0xFF108EE9,
    "primaryColorLight": 0xFF9C27B0,
    "scaffoldBackgroundColor": 0xffeff0f2,
  },
};

class AppTheme {
  static Map mainColor = materialColor['qixiManage'];
  static getThemeData(String theme) {
    mainColor = materialColor[theme];
    ThemeData themData = ThemeData(
      scaffoldBackgroundColor: Color(mainColor["scaffoldBackgroundColor"]), // 页面的背景颜色
      primaryColor: Color(mainColor["primaryColor"]), // 主颜色
      primaryColorLight: Color(mainColor["primaryColorLight"]),
    );
    return themData;
  }
}
