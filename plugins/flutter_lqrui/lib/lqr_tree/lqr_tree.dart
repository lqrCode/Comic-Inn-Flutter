import 'package:flutter_lqrui/lqr_common/lqr_common.dart';
export './lqr_tree_model.dart';

// 如果level存在，就不会受select控制

class LqrTree extends StatefulWidget {
  final List<LqrTreeListsModel> lists;
  final bool Function(LqrTreeListsModel, String) filter; // 过滤
  final bool isMultiple; // 是否可多选
  final bool expandAll; // 是否展开所有节点
  final List<String> checkedValue; // 选中的value数组
  final int level; // 多少层
  final String searchHintText; // 搜索提示
  final int checkIndex; // 层级选择

  const LqrTree({
    Key key,
    this.lists,
    this.filter,
    this.isMultiple = false,
    this.expandAll = false,
    this.level = 10,
    this.checkedValue,
    this.searchHintText = "输入关键字搜索",
    this.checkIndex,
  }) : super(key: key);

  @override
  _LqrTreeState createState() => _LqrTreeState();
}

class _LqrTreeState extends State<LqrTree> {
  String _searchVal = '';
  List<LqrTreeListsModel> _lists = [];
  Map<int, LqrTreeListsModel> _checkedDatas = {};
  int _key = 0;

  @override
  void initState() {
    super.initState();
    _lists = LqrTreeModel.fromJson(LqrTreeModel(lists: widget.lists).toJson()).lists;
    traversal(_lists, 1);
  }

  void traversal(obj, level) {
    for (LqrTreeListsModel item in obj) {
      // 是否全部展开
      if (widget.expandAll) item.isShow = true;
      // 反选
      var aList = List<LqrTreeListsModel>();
      aList.addAll(item.lists);
      aList.add(item);
      aList.forEach((v) {
        _key++;
        v.key = _key;
        if (level == widget.checkIndex) v.enabled = true;
        if (widget.checkedValue.indexOf(v.value) != -1) {
          v.isSelect = true;
          widget.isMultiple ? _checkedDatas[_key] = v : _checkedDatas[0] = v;
        }
      });
      // 层级处理
      if (level >= widget.level) {
        item.children = [];
        continue;
      }
      if (item.children.length > 0) traversal(item.children, level + 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LqrAppBar(
        title: '转派',
        actions: <Widget>[
          LqrButton(
            title: '确认',
            onTap: confirm,
            size: LqrButtonSize.mini,
            margin: Lqr().edgeH(style: 20),
            width: 100,
            type: LqrButtonType.primary,
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: Lqr().width(100),
            padding: Lqr.ui.edgeA(20),
            decoration: BoxDecoration(color: Colors.white),
            margin: Lqr.ui.edgeB(20),
            child: LqrSearch(
              hintText: widget.searchHintText,
              onChanged: (val) => setState(() => _searchVal = val),
            ),
          ),
          Expanded(
            child: Container(
              width: Lqr.ui.screenUtil.screenWidth,
              padding: Lqr.ui.edgeA(20),
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: _lists.map((LqrTreeListsModel v) => page(v)).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget page(LqrTreeListsModel data) {
    return Column(
      children: <Widget>[
        data.children.length > 0 || filter(data, _searchVal)
            ? Container(
                height: Lqr().width(60),
                child: GestureDetector(
                  onTap: () => onTap(data, data.children.length == 0),
                  child: Row(
                    children: <Widget>[
                      Lqr.ui.iconF(data.children.length == 0 ? 0xe603 : 0xe706, size: 30),
                      Container(width: Lqr().width(30)),
                      Expanded(child: Container(child: Text(data.name, style: TextStyle(fontSize: Lqr.ui.size(28))))),
                      Container(width: Lqr().width(20)),
                      statusType(data),
                    ],
                  ),
                ),
              )
            : Container(),
        data.isShow && data.children.length > 0
            ? Container(
                padding: Lqr.ui.edgeL(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: data.children.map((LqrTreeListsModel v) => page(v)).toList(),
                ),
              )
            : Container(),
        ...data.lists.map((LqrTreeListsModel v) => page(v)),
      ],
    );
  }

  Widget statusType(LqrTreeListsModel data) {
    List<Widget> lists = [];
    if (data.children.length == 0 || data.enabled) {
      int icon = widget.isMultiple ? (data.isSelect ? 0xe61f : 0xe660) : (_checkedDatas.length > 0 && data.value == _checkedDatas[0].value ? 0xe61f : 0xe660);
      lists.add(GestureDetector(
        onTap: () => onTap(data, true),
        child: Lqr.ui.iconF(icon, size: 25),
      ));
    }
    if (data.children.length > 0) {
      int icon = data.isShow ? 0xe658 : 0xe65a;
      lists.add(Lqr.ui.iconF(icon, size: 25));
    }
    return Container(
      width: Lqr().width(60),
      child: Row(children: lists, mainAxisAlignment: MainAxisAlignment.spaceBetween),
    );
  }

  bool filter(data, val) {
    if (widget.filter == null)
      return data.name.contains(val);
    else
      return widget.filter(data, val);
  }

  void onTap(data, type) {
    setState(() {
      switch (type) {
        case true:
          if (widget.isMultiple) {
            data.isSelect = !data.isSelect;
            data.isSelect ? _checkedDatas[data.key] = data : _checkedDatas.remove(data.key);
          } else {
            _checkedDatas = {};
            _checkedDatas[0] = data;
          }
          break;
        case false:
          data.isShow = !data.isShow;
          break;
      }
    });
  }

  void confirm() {
    LqrTreeClaabackData a = LqrTreeClaabackData();
    a.checkedKeys = _checkedDatas.keys.toList();
    a.checkedValue = _checkedDatas.values.map((v) => v.value).toList();
    a.checkedMap = _checkedDatas;
    a.checkedLists = _checkedDatas.values.toList();
    Navigator.pop(context, a);
  }
}

class LqrTreeClaabackData {
  List<int> checkedKeys = [];
  List<String> checkedValue = [];
  Map<int, LqrTreeListsModel> checkedMap = {};
  List<LqrTreeListsModel> checkedLists = [];
}
