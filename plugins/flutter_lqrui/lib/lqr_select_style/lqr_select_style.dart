import 'package:flutter_lqrui/lqr_common/lqr_common.dart';

class LqrSelectStyle extends StatefulWidget {
  final Widget content;
  final String leading;
  final Function() onTap;
  final String value;
  final String hintText;
  const LqrSelectStyle({
    Key key,
    this.content,
    this.leading,
    this.onTap,
    this.value = '',
    this.hintText = '',
  }) : super(key: key);
  @override
  _LqrSelectStyleState createState() => _LqrSelectStyleState();
}

class _LqrSelectStyleState extends State<LqrSelectStyle> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        widget.leading == null
            ? Container()
            : Container(
                margin: Lqr.ui.edgeR(Lqr.ui.edgeBa),
                child: Text(widget.leading, style: TextStyle(color: Lqr.ui.textC3, fontSize: Lqr.ui.size(28))),
              ),
        Expanded(
          child: Container(
            height: Lqr.ui.width(60),
            padding: Lqr.ui.edgeH(style: 10, left: 15, right: 15),
            decoration: BoxDecoration(borderRadius: Lqr.ui.borderRadius(), border: Lqr.ui.borderA(1)),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: DefaultTextStyle(
                    style: TextStyle(fontSize: Lqr.ui.size(26), color: Lqr.ui.textC2),
                    child: widget.content ??
                        InkWell(
                          onTap: widget.onTap,
                          child: widget.value == '' ? Text(widget.hintText, style: TextStyle(color: Lqr.ui.textC4)) : Text(widget.value),
                        ),
                  ),
                ),
                Lqr.ui.icon(0xe65a),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
