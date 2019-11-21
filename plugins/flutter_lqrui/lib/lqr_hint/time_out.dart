import 'package:flutter_lqrui/lqr_common/lqr_common.dart';

class TimeOut extends StatefulWidget {
  final params;
  TimeOut({Key key, this.params}) : super(key: key);
  @override
  _TimeOutState createState() => _TimeOutState();
}

class _TimeOutState extends State<TimeOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('超时')),
      body: Container(
        height: Lqr.ui.screenUtil.screenWidth-80,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                IconData(0xe62c, fontFamily: 'IconFont'),
                color: Lqr.ui.textC2,
                size: Lqr.ui.size(80),
              ),
              Text('\n\n请求超时',
                style: TextStyle(color: Lqr.ui.textC2,fontSize: Lqr.ui.size(18)),
              ),
              Text('\n\n${widget.params['text']??''}',
                style: TextStyle(color: Lqr.ui.textC2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
