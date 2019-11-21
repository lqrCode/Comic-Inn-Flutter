import 'package:flutter_lqrui/lqr_common/lqr_common.dart';

class LqrSearchLists extends StatefulWidget {
  final Widget childItem;
  final Widget searchWidget;
  final EasyRefreshController loadingController;
  final String title;
  final bool searchShow; //显示搜索

  const LqrSearchLists({
    Key key,
    this.childItem,
    this.searchWidget,
    this.loadingController,
    this.title = "",
    this.searchShow = false,
  }) : super(key: key);

  @override
  _LqrSearchListsState createState() => _LqrSearchListsState();
}

class _LqrSearchListsState extends State<LqrSearchLists> {
  bool _searchShow;

  @override
  void initState() {
    super.initState();
    _searchShow = widget.searchShow;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LqrAppBar(
        title: widget.title,
        actions: <Widget>[
          IconButton(
            icon: Text(_searchShow ? '搜索' : '筛选', style: TextStyle(fontSize: Lqr.ui.size(28), color: Lqr.ui.textC2)),
            onPressed: () => setState(() {
              _searchShow = !_searchShow;
              if (!_searchShow) widget.loadingController.callRefresh();
            }),
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          widget.childItem,
          _searchShow
              ? Positioned(
                  top: 0,
                  left: 0,
                  child: GestureDetector(
                    onTap: () => setState(() => _searchShow = false),
                    child: Container(
                      width: Lqr.ui.screenUtil.screenWidth,
                      height: Lqr.ui.screenUtil.screenHeight,
                      color: Colors.black12,
                      child: UnconstrainedBox(
                        alignment: Alignment.topLeft,
                        child: Container(
                          width: Lqr.ui.screenUtil.screenWidth,
                          padding: Lqr.ui.edgeA(Lqr.ui.edgeBa),
                          decoration: BoxDecoration(boxShadow: Lqr.ui.boxShadow, color: Colors.white),
                          child: widget.searchWidget,
                        ),
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
