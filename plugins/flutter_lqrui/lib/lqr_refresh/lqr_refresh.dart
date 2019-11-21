import 'package:flutter_lqrui/lqr_common/lqr_common.dart';

typedef Future<void> OnRefresh(v);
typedef Future<void> LoadMore(v);
typedef Future<void> NoMoreFun();

class LqrRefresh extends StatefulWidget {
  final Widget child;
  final List list;
  final Future Function(EasyRefreshController controller) onRefresh;
  final LoadMore loadMore;
  final bool loadingMoreStauts;
  final bool enableControlFinishRefresh;
  final bool enableControlFinishLoad;
  final bool firstRefresh;
  final EasyRefreshController loadingController;
  final String showText;
  final String noMoreStr;
  final NoMoreFun noMoreFun;
  final bool topBouncing;
  final Widget emptyWidget;
  LqrRefresh({
    Key key,
    this.child,
    this.list,
    this.onRefresh,
    this.loadMore,
    this.loadingMoreStauts,
    this.enableControlFinishRefresh = false,
    this.enableControlFinishLoad = false,
    this.loadingController,
    this.showText = '暂无数据~',
    this.firstRefresh = true,
    this.noMoreStr = '点击了解更多',
    this.noMoreFun,
    this.topBouncing = true,
    this.emptyWidget,
  }) : super(key: key);
  @override
  _LqrRefreshState createState() => _LqrRefreshState();
}

class _LqrRefreshState extends State<LqrRefresh> {
  int _loadIndex = 0;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
      enableControlFinishRefresh: widget.enableControlFinishRefresh,
      enableControlFinishLoad: widget.enableControlFinishLoad,
      taskIndependence: true,
      controller: widget.loadingController,
      firstRefresh: widget.firstRefresh,
      topBouncing: widget.topBouncing,
      emptyWidget: widget.list.length == 0 ? widget.emptyWidget : null,
      header: ClassicalHeader(
        refreshText: "下拉刷新",
        refreshReadyText: '释放刷新',
        refreshingText: '刷新中...',
        refreshedText: "刷新完成",
        refreshFailedText: "刷新失败",
        noMoreText: "没有更多数据",
        infoText: "上次更新 %T",
      ),
      footer: ClassicalFooter(
        loadText: "上拉加载更多",
        loadReadyText: "释放加载",
        loadingText: "加载中...",
        loadedText: "加载完成",
        loadFailedText: "加载失败",
        noMoreText: "没有更多数据",
        infoText: "上次加载 %T",
      ),
      child: _loadIndex > 0 && widget.list.length == 0
          ? LqrNoData(
              showText: widget.showText,
              btnText: widget.noMoreStr,
              onclick: widget.noMoreFun,
            )
          : widget.child,
      onRefresh: widget.onRefresh == null
          ? null
          : () async {
              await widget.onRefresh(widget.loadingController);
              setState(() {
                _loadIndex++;
              });
            },
      onLoad: widget.loadMore == null
          ? null
          : () async {
              await widget.loadMore(widget.loadingController);
            },
    );
  }
}
