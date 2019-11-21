import 'package:flutter_lqrui/lqr_common/lqr_common.dart';

class LqrImage extends StatelessWidget {
  final double width;
  final double height;
  final String src;
  final bool errorHide;
  LqrImage({Key key, @required this.width, this.height, this.src, this.errorHide = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (src == null || src == "") && errorHide
        ? Container()
        : Container(
            width: Lqr.ui.width(width),
            height: Lqr.ui.width(height),
            child: CachedNetworkImage(
              imageUrl: src ?? '',
              placeholder: (context, url) => loadItem(context),
              errorWidget: (context, url, error) => Image.asset("assets/images/imageError.jpg", fit: BoxFit.cover),
              fit: BoxFit.cover,
            ),
          );
  }

  Widget loadItem(context) {
    return Container(
      color: Colors.grey[100],
      width: Lqr.ui.width(width),
      height: Lqr.ui.width(height),
      child: Center(
        child: SizedBox(
          width: Lqr.ui.width(24),
          height: Lqr.ui.width(24),
          child: CircularProgressIndicator(
            strokeWidth: 2.0,
            backgroundColor: Theme.of(context).primaryColor,
            valueColor: AlwaysStoppedAnimation(Theme.of(context).primaryColor),
          ),
        ),
      ),
    );
  }
}
