import 'package:ComicInn/common/common.dart';
import 'dart:ui';

class ComicDetail extends StatefulWidget {
  final String id;
  const ComicDetail({Key key, this.id}) : super(key: key);
  @override
  _ComicDetailState createState() => _ComicDetailState();
}

class _ComicDetailState extends State<ComicDetail> {
  Future<dynamic> _lqrFutureBuilder;
  ComicDetailModel _model;

  @override
  void initState() {
    super.initState();
    _lqrFutureBuilder = lqrHttp(LqrApis.comicDetail, "GET", data: {"id": widget.id});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: FutureBuilder(
          future: _lqrFutureBuilder,
          builder: (context, snapshot) {
            if (snapshot.data != null) _model = ComicDetailModel.fromJson(snapshot.data.data);
            return LqrFutureBuilder(
              snapshot: snapshot,
              content: () => SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    top,
                    intro,
                    chapter,
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget get top => Stack(
        children: <Widget>[
          Container(
            height: Lqr.ui.width(415),
            color: Colors.white,
          ),
          Container(
            height: Lqr.ui.width(305),
            width: Lqr.ui.screenUtil.screenWidth,
            decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(_model.image), fit: BoxFit.cover)),
          ),
          IgnorePointer(
            ignoring: true,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 10),
              child: Container(
                color: Colors.black.withOpacity(0.5),
                height: Lqr.ui.width(305),
              ),
            ),
          ),
          Positioned(
            top: Lqr().width(110),
            left: 0,
            child: Container(
              width: Lqr.ui.screenUtil.screenWidth,
              height: Lqr().width(280),
              padding: Lqr.ui.edgeLR(Lqr.ui.edgeBa),
              child: Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(border: Lqr.ui.borderA(4), boxShadow: Lqr.ui.boxShadow),
                    margin: Lqr().edgeR(Lqr.ui.edgeBa),
                    child: LqrImage(
                      src: _model.image,
                      width: 210,
                      height: 280,
                    ),
                  ),
                  Expanded(
                    child: DefaultTextStyle(
                      style: TextStyle(color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(_model.title, style: TextStyle(fontSize: Lqr().size(36))),
                          Container(height: Lqr().width(6)),
                          Text(_model.author, style: TextStyle(fontSize: Lqr().size(24))),
                          Container(height: Lqr().width(6)),
                          Text(_model.hot, style: TextStyle(fontSize: Lqr().size(24))),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      );

  Widget get intro => content(
        title: '剧情简介',
        widget: Text(_model.intro, style: TextStyle(fontSize: Lqr().size(28), color: Lqr.ui.textC3)),
      );

  Widget get chapter => content(
        title: '目录',
        widget: GridView.builder(
          shrinkWrap: true,
          physics: new NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: Lqr().width(Lqr.ui.edgeBa),
            crossAxisSpacing: Lqr().width(Lqr.ui.edgeBa),
            childAspectRatio: 2.4,
          ),
          itemCount: _model.chapter.length,
          itemBuilder: (context, i) {
            return GestureDetector(
              onTap: () => lqrRouter(Routes.comicPlay(id: widget.id, chapter: _model.chapter, index: i)),
              child: Container(
                alignment: Alignment.center,
                color: Color(0xFFf5f5f5),
                child: Text(_model.chapter[i].name, maxLines: 1, style: TextStyle(color: Lqr.ui.textC2)),
              ),
            );
          },
        ),
      );

  Widget content({title, widget}) => Container(
        padding: Lqr().edgeA(Lqr.ui.edgeBa),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(title, style: TextStyle(fontSize: Lqr().size(28), color: Lqr.ui.textC2)),
              ],
            ),
            Container(height: Lqr().width(10)),
            widget
          ],
        ),
      );
}
