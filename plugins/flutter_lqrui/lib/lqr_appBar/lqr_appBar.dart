import 'package:flutter_lqrui/lqr_common/lqr_common.dart';

class LqrAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool automaticallyImplyLeading;
  final Widget leading;
  final String title;
  final Color backgroundColor;
  final Color textC;
  final Widget middle;
  final List<Widget> actions;

  const LqrAppBar({
    Key key,
    this.automaticallyImplyLeading = true,
    this.leading,
    this.title = "",
    this.backgroundColor = Colors.white,
    this.textC,
    this.middle,
    this.actions,
  }) : super(key: key);

  @override
  Size get preferredSize {
    return new Size.fromHeight(Lqr.ui.width(90));
  }

  @override
  Widget build(BuildContext context) {
    final ModalRoute<dynamic> parentRoute = ModalRoute.of(context);
    final bool canPop = parentRoute?.canPop ?? false;
    return PreferredSize(
      child: AppBar(
        title: Text(title, style: TextStyle(color: textC ?? Lqr.ui.textC2, fontSize: Lqr.ui.size(36), fontWeight: FontWeight.w300)),
        backgroundColor: backgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(color: textC ?? Lqr.ui.textC2),
        centerTitle: true,
        leading: leading ?? canPop
            ? IconButton(
                icon: Icon(Icons.chevron_left, color: Lqr.ui.textC2),
                iconSize: Lqr.ui.size(60),
                onPressed: () => Navigator.pop(context ?? Lqr.ui.scaffoldCtx),
              )
            : Container(),
        automaticallyImplyLeading: automaticallyImplyLeading,
        actions: actions,
      ),
      preferredSize: Size.fromHeight(Lqr.ui.width(90)),
    );
  }
}
