import 'package:flutter_lqrui/lqr_common/lqr_common.dart';

class LqrInput extends StatelessWidget {
  final Function(String) onChanged;
  final Function() onTap;
  final String hintText;
  final TextEditingController controller;
  final Color background;
  final Widget icon;
  final BorderRadiusGeometry borderRadius;
  final BoxBorder border;
  final double height;
  final int maxLines;
  final EdgeInsetsGeometry contentPadding;
  final bool circle; // 圆角按钮
  final double round; // 是否圆形
  final bool enabled; // 是否启动
  final bool required; // 是否显示必填星号
  final TextInputType keyboardType; // 输入类型
  final int maxLength; // 长度
  final List<TextInputFormatter> inputFormatters; // 输入规则
  final int type;
  final String title;

  const LqrInput({
    Key key,
    this.onChanged,
    this.hintText,
    this.onTap,
    this.controller,
    this.background,
    this.icon,
    this.borderRadius,
    this.border,
    this.height = 80,
    this.maxLines,
    this.contentPadding,
    this.circle = false,
    this.round = 10,
    this.enabled = true,
    this.required = false,
    this.keyboardType = TextInputType.text,
    this.maxLength,
    this.inputFormatters,
    this.type = 1,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(color: Lqr.ui.textC2, fontSize: Lqr.ui.size(24)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          title == null ? Container() : Text(title),
          Expanded(
            child: Container(
              height: maxLines == null ? Lqr.ui.width(height) : null,
              decoration: BoxDecoration(
                color: background,
                borderRadius: border != null ? null : BorderRadius.circular(Lqr.ui.width(circle ? height : round)),
                border: border,
              ),
              alignment: Alignment.centerLeft,
              child: input(),
            ),
          ),
        ],
      ),
    );
  }

  Widget input() {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      enabled: enabled,
      maxLines: maxLines ?? 1,
      maxLength: maxLength,
      inputFormatters: inputFormatters,
      style: TextStyle(
        textBaseline: TextBaseline.alphabetic,
        color: Lqr.ui.textC3,
        fontSize: Lqr.ui.size(24),
      ),
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        counterText: '',
        border: InputBorder.none,
        contentPadding: contentPadding ?? Lqr.ui.edgeTB(20),
        icon: required
            ? Row(
                children: <Widget>[Text('* ', style: TextStyle(color: Colors.red)), icon],
                mainAxisSize: MainAxisSize.min,
              )
            : icon,
      ),
    );
  }
}
