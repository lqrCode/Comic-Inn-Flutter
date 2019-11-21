import 'package:flutter_lqrui/lqr_common/lqr_common.dart';

class LqrSelectLists extends StatefulWidget {
  final List<LqrTreeListsModel> lists;
  final Widget Function(LqrTreeListsModel data, bool isSelect) content;
  final bool Function(LqrTreeListsModel data) filter; // 过滤
  final bool isMultiple; // 是否可多选
  final LqrSelectData selectData; // 选中的数据
  final Function(LqrSelectData) onChanged;

  const LqrSelectLists({
    Key key,
    this.lists,
    this.content,
    this.filter,
    this.isMultiple = false,
    this.selectData,
    this.onChanged,
  }) : super(key: key);
  @override
  _LqrSelectListsState createState() => _LqrSelectListsState();
}

class _LqrSelectListsState extends State<LqrSelectLists> {
  Map<String, LqrTreeListsModel> _checkedDatas = {};

  @override
  void initState() {
    super.initState();
    _checkedDatas = widget.selectData.checkedDatas ?? {};
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: widget.lists.map((LqrTreeListsModel v) => widget.filter != null && !widget.filter(v) ? Container() : page(v)).toList(),
    );
  }

  Widget page(LqrTreeListsModel data) {
    bool isSelect = _checkedDatas.containsKey(data.value);
    return GestureDetector(
      onTap: () {
        setState(() {
          if (!widget.isMultiple) _checkedDatas.clear();
          isSelect && widget.isMultiple ? _checkedDatas.remove(data.value) : _checkedDatas[data.value] = data;
        });
        if (widget.onChanged != null) {
          LqrSelectData a = LqrSelectData();
          a.checkedDatas = _checkedDatas;
          a.checkedValue = _checkedDatas.keys.toList();
          a.checkedLists = _checkedDatas.values.toList();
          widget.onChanged(a);
        }
      },
      child: widget.content == null
          ? LqrCard(
              margin: Lqr.ui.edgeB(Lqr.ui.edgeBa),
              content: Row(
                children: <Widget>[
                  Lqr.ui.icon(isSelect ? 0xe61f : 0xe660),
                  Container(width: Lqr.ui.width(Lqr.ui.edgeBa)),
                  Expanded(child: Text(data.name)),
                ],
              ),
            )
          : widget.content(data, isSelect),
    );
  }
}

class LqrSelectData {
  List<String> checkedValue = [];
  Map<String, LqrTreeListsModel> checkedDatas = {};
  List<LqrTreeListsModel> checkedLists = [];
}
