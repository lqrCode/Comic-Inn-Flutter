import 'package:ComicInn/common/common.dart';
import 'package:ComicInn/pages/comic/comic_home.dart';
import 'package:ComicInn/pages/my/my_home.dart';

class Pages extends StatefulWidget {
  _PagesState createState() => _PagesState();
}

class _PagesState extends State<Pages> with SingleTickerProviderStateMixin {
  List homePages = [
    {
      "widget": BottomNavigationBarItem(
        icon: Icon(IconData(0xe61b, fontFamily: 'IconFont')),
        // activeIcon: Icon(IconData(0xe659, fontFamily: 'IconFont')),
        title: Text('漫画'),
      ),
      "content": ComicHome(),
    },
    {
      "widget": BottomNavigationBarItem(
        icon: Icon(IconData(0xe61c, fontFamily: 'IconFont')),
        // activeIcon: Icon(IconData(0xe65a, fontFamily: 'IconFont')),
        title: Text('我的'),
      ),
      "content": MyHome(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Store.connect<ConfigProvide>(
      builder: (context, configProvide, child) {
        return Scaffold(
          body: IndexedStack(
            index: configProvide.pageIndex,
            children: homePages.map<Widget>((item) => item['content']).toList(),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: configProvide.pageIndex,
            fixedColor: Theme.of(context).primaryColor,
            onTap: (int index) => configProvide.setPageIndex(index),
            type: BottomNavigationBarType.fixed,
            items: homePages.map<BottomNavigationBarItem>((item) => item['widget']).toList(),
          ),
        );
      },
    );
  }
}
