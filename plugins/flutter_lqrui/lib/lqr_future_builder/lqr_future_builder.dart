import 'package:flutter_lqrui/lqr_common/lqr_common.dart';

class LqrFutureBuilder extends StatelessWidget {
  final AsyncSnapshot<dynamic> snapshot;
  final content;
  LqrFutureBuilder({Key key, this.snapshot, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
        return LqrFutureBuilderNone();
      case ConnectionState.waiting:
        return LqrFutureBuilderWaiting();
      default:
        if (snapshot.hasError) {
          return LqrError(errorText: snapshot.error);
        } else {
          return content();
        }
    }
  }
}

class LqrFutureBuilderWaiting extends StatelessWidget {
  const LqrFutureBuilderWaiting({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      // child: SpinKitWave(color: Lqr.ui.primaryC, size: Lqr.ui.size(60)),
      child: SpinKitFadingCube(color: Lqr.ui.primaryC, size: Lqr.ui.size(60)),
    );
  }
}

class LqrFutureBuilderError extends StatelessWidget {
  final snapshot;
  final futureContext;
  LqrFutureBuilderError({Key key, this.snapshot, this.futureContext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('${snapshot.error}')),
    );
  }
}

class LqrFutureBuilderNone extends StatelessWidget {
  LqrFutureBuilderNone({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('开始'),
    );
  }
}
