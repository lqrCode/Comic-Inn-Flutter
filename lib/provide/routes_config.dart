import 'package:ComicInn/common/common.dart';

class IconMap {
  int icon; // 路由图标
  int color; // 路由颜色
  String name; // 路由名字
  var router; // 路由跳转
  String mpname; // 小程序跳转
  bool noShow; // 是否显示
  String authStatus;
  String image;
  IconMap({
    this.icon,
    this.color,
    this.name,
    this.router,
    this.mpname,
    this.noShow,
    this.authStatus,
    this.image,
  });
}

class ServeIconList {
  String title;
  List list;
  ServeIconList({this.title, this.list});
}

class RoutesConfigStore with ChangeNotifier {
  // List<ServeIconList> serveIconList = [
  //   ServeIconList(title: "物业服务", list: [
  //     IconMap(icon: 0xe61d, color: 0xFF63a6e9, name: "移动抄表", router: Routes.meterReadingLists()),
  //     IconMap(icon: 0xe61f, color: 0xFFf3983e, name: "仪表查询", router: Routes.meterLists()),
  //     IconMap(icon: 0xe624, color: 0xFFf5a542, name: "工单录入", router: Routes.workOrderAdd()),
  //     IconMap(icon: 0xe620, color: 0xFF3da45e, name: "我的工单", router: Routes.workOrderLists()),
  //     IconMap(icon: 0xe621, color: 0xFFf1a241, name: "客户查询", router: Routes.clientLists()),
  //   ]),
  //   ServeIconList(title: "房产管理", list: [
  //     IconMap(icon: 0xe622, color: 0xFF7abdf9, name: "房产查询", router: Routes.houseLists()),
  //   ]),
  // ];
}
