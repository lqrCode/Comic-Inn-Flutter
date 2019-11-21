import 'package:ComicInn/common/common.dart';
import 'package:ComicInn/config/index.dart';

import 'package:ComicInn/config/theme.dart' show AppTheme; //主题
import 'package:flutter_localizations/flutter_localizations.dart'; //语言包实例化
import 'package:ComicInn/untils/app_update.dart';
import 'package:ComicInn/untils/android_back_desktop.dart';

// import 'package:janalytics/janalytics.dart';
// import 'package:jpush_flutter/jpush_flutter.dart';
import 'package:package_info/package_info.dart';

import 'package:ComicInn/pages/page.dart';
import 'package:ComicInn/splash_page.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // final JPush jpush = JPush();
  // final Janalytics janalytics = Janalytics();

  @override
  void initState() {
    Store.setStoreCtx(context);
    WidgetsBinding.instance.addPostFrameCallback((callback) async {
      initPlatformState();
      checkUpdate();
    });
    super.initState();
  }

  Future<void> initPlatformState() async {
    try {
      // await AMap.init('您的key');
      // 推送
      // jpush.setup(appKey: LqrConfig.jiguangAppKey, channel: "theChannel", production: false, debug: true);
      // 统计
      // janalytics.setup(appKey: LqrConfig.jiguangAppKey, channel: "theChannel");
      // janalytics.initCrashHandler(); //开启crashlog日志上报
      // janalytics.onPageStart(widget.runtimeType.toString());
    } catch (e) {
      print(e);
      // ...
    }
  }

  @override
  Widget build(BuildContext context) {
    Store.setWidgetCtx(context);
    return Store.connect<ConfigProvide>(
      builder: (context, ConfigProvide config, child) {
        ErrorWidget.builder = (FlutterErrorDetails flutterErrorDetails) => config.widgetDebug == "1" ? Scaffold(body: SingleChildScrollView(child: Center(child: Text(flutterErrorDetails.toString())))) : Error();
        return MaterialApp(
          title: '企业孵化器',
          debugShowCheckedModeBanner: false,
          showPerformanceOverlay: false,
          theme: AppTheme.getThemeData(config.theme),
          home: WillPopScope(
            onWillPop: () async {
              AndroidBackTop.backDeskTop();
              return false;
            },
            child: Scaffold(
              body: Builder(
                builder: (BuildContext scaffoldCtx) {
                  MediaQuery.of(scaffoldCtx);
                  Store.setScaffoldCtx(scaffoldCtx);
                  Lqr.ui = Lqr(
                    screenWidth: LqrConfig.screenWidth,
                    screenHeight: LqrConfig.screenHeight,
                    scaffoldCtx: scaffoldCtx,
                  )..init(scaffoldCtx);
                  return config.initStatus == 0 ? SplashPage() : Pages();
                },
              ),
            ),
          ),
          localizationsDelegates: [
            PickerLocalizationsDelegate.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: [const Locale('zh', 'CH'), const Locale('en', 'US')],
        );
      },
    );
  }
}

void main() async {
  await SpUtil.getInstance();
  Provider.debugCheckInvalidValueType = null;
  final configProvide = ConfigProvide();
  configProvide.token = SpUtil.getString('token', defValue: '0');
  configProvide.theme = SpUtil.getString('theme', defValue: 'qixiManage');
  configProvide.widgetDebug = SpUtil.getString('widgetDebug', defValue: '0');
  configProvide.packageInfo = await PackageInfo.fromPlatform();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: configProvide),
        ChangeNotifierProvider.value(value: RoutesConfigStore()),
      ],
      child: MyApp(),
    ),
  );
}
