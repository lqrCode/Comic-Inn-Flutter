<!--
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-11-04 17:12:59
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-11-11 15:32:42
 -->

``` dart
 int page = 1;
  int count = 20;
  List<Lists> lists = [];
  EasyRefreshController loadingController = EasyRefreshController();

  @override
  Widget build(BuildContext context) {
    return LqrSearchLists(
      childItem: childItem(),
      searchWidget: searchWidget(),
      loadingController: loadingController,
      lists: lists,
      onRefresh: (v) async {
        page = 1;
        await loadingData();
      },
      loadMore: (v) async {
        page++;
        await loadingData();
      },
    );
  }

  Future loadingData() async {
    try {
      var data = {'page': page, 'count': count};
      var res = await lqrHttp(LqrApis.meterLists, "POST", data: data);
      MeterListsModel a = MeterListsModel.fromJson(res.data);
      if (page == 1) lists.clear();
      setState(() {
        lists.addAll(a.lists);
      });
      loadingController.finishLoad(noMore: page >= a.pages, success: true);
    } catch (e) {
      Lqr.ui.toast(e);
    }
  }

  Widget searchWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
          
      ],
    );
  }

  Widget childItem() {
    return ListView.builder(
      padding: Lqr.ui.edgeLR(Lqr.ui.edgeBa),
      scrollDirection: Axis.vertical,
      itemCount: lists.length,
      itemBuilder: (BuildContext context, int i) {
        return LqrCard(
          onTap: () => lqrRouter(Routes.clientDetail(lists[i].id)),
          margin: Lqr.ui.edgeT(Lqr.ui.edgeBa),
          hearder: Text(lists[i].meterName, style: TextStyle(color: Theme.of(context).primaryColor, fontSize: Lqr.ui.size(28))),
          content: Column(
              
          ),
        );
      },
    );
  }
```