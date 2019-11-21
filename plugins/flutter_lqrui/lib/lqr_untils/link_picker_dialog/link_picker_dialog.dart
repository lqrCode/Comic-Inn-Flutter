import 'package:flutter_lqrui/lqr_common/lqr_common.dart';

void linkPickerDialog({context, List select, List<LqrTreeListsModel> lists, callback(List<LqrTreeListsModel> val)}) {
  showDialog(
    context: context ?? Lqr.ui.scaffoldCtx,
    builder: (context) {
      return LinkPickerDialog(lists: lists, callback: callback, select: select);
    },
  );
}

class LinkPickerDialog extends StatefulWidget {
  final List lists;
  final Function(List<LqrTreeListsModel> val) callback;
  final List<LqrTreeListsModel> select;
  LinkPickerDialog({Key key, this.lists, this.callback, this.select}) : super(key: key);
  @override
  _LinkPickerDialogState createState() => _LinkPickerDialogState();
}

class _LinkPickerDialogState extends State<LinkPickerDialog> with AutomaticKeepAliveClientMixin {
  List<LqrTreeListsModel> tabList = [LqrTreeListsModel(name: "请选择")]; // tabar 数组
  int tabKey = 0; //  tabar键值
  List selectLists = [];
  List selectIndex = [999999];

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    selectLists = widget.lists;
    if (widget.select != null && widget.select.length > 0 && widget.select[0].name != '') {
      List b = widget.lists;
      tabKey = widget.select.length - 1;
      tabList.clear();
      selectIndex.clear();
      for (var i = 0; i < widget.select.length; i++) {
        int a = b.indexWhere((v) => v.value == widget.select[i].value);
        if (a != -1) {
          selectIndex.add(a);
          tabList.add(
            LqrTreeListsModel(
              name: widget.select[i].name,
              value: widget.select[i].value,
              children: b[a].children,
            ),
          );
          b = b[a].children; //替换为子children
        }
      }
      selectLists = tabList[tabKey - 1].children;
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Scaffold(
        backgroundColor: Colors.black26,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: Lqr.ui.edgeA(Lqr.ui.edgeBa),
                width: Lqr.ui.screenUtil.screenWidth,
                decoration: BoxDecoration(color: Colors.white, borderRadius: Lqr.ui.borderRadiusT(style: 20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              height: Lqr.ui.height(60),
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                children: <Widget>[
                                  // 头部父选择
                                  for (var i = 0; i < tabList.length; i++)
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          tabKey = i;
                                          selectLists = tabKey == 0 ? widget.lists : tabList[tabKey - 1].children;
                                        });
                                      },
                                      child: Container(
                                        margin: Lqr.ui.edgeR(20),
                                        decoration: BoxDecoration(
                                          border: Border(bottom: BorderSide(width: Lqr.ui.width(2), color: tabKey == i ? Colors.red : Colors.white)),
                                        ),
                                        child: Text(tabList[i].name, style: TextStyle(fontSize: Lqr.ui.size(28))),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            child: Text('确定', style: TextStyle(color: Theme.of(context).primaryColor)),
                            onTap: () {
                              List<LqrTreeListsModel> a = [...tabList];
                              if (a[tabKey].value != null) {
                                widget.callback(a);
                                Navigator.of(context).pop();
                              } else {
                                Lqr.ui.toast('请选择完整');
                              }
                            },
                          )
                        ],
                      ),
                    ),
                    Lqr.ui.dividerWidget(),
                    Container(
                      height: Lqr.ui.height(Lqr.ui.screenHeight / 2),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: selectLists.length,
                        itemBuilder: (BuildContext context, int i) {
                          return GestureDetector(
                            child: Text(
                              selectLists[i].name,
                              style: TextStyle(
                                color: i == selectIndex[tabKey] ? Colors.red : Lqr.ui.textC3,
                                height: Lqr.ui.height(4),
                                fontSize: Lqr.ui.size(28),
                              ),
                            ),
                            onTap: () {
                              // 下面子选择
                              setState(() {
                                tabList[tabKey] = selectLists[i];
                                selectIndex[tabKey] = i;
                                if (selectLists[i].children != null && selectLists[i].children.length > 0) {
                                  tabKey++;
                                  selectIndex.add(999999);
                                  if (tabList.length - 1 >= tabKey) {
                                    tabList.removeRange(tabKey + 1, tabList.length);
                                    tabList[tabKey] = LqrTreeListsModel(name: "请选择");
                                    selectIndex.removeRange(tabKey + 1, selectIndex.length);
                                    selectIndex[tabKey] = 999999;
                                  } else {
                                    tabList.add(LqrTreeListsModel(name: "请选择"));
                                  }
                                  selectLists = selectLists[i].children;
                                }
                              });
                            },
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
