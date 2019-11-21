import 'package:ComicInn/common/common.dart';
import 'package:ComicInn/models/comic/comic_home_model.dart';

class ComicHome extends StatefulWidget {
  final params;
  ComicHome({Key key, this.params}) : super(key: key);
  _ComicHomeState createState() => _ComicHomeState();
}

class _ComicHomeState extends State<ComicHome> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  Future<dynamic> _lqrFutureBuilder;
  ComicHomeModel _model;

  @override
  void initState() {
    super.initState();
    _lqrFutureBuilder = lqrHttp(LqrApis.comicHome, "GET");
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: FutureBuilder(
          future: _lqrFutureBuilder,
          builder: (context, snapshot) {
            print(snapshot.data);
            if (snapshot.data != null) _model = ComicHomeModel.fromJson(snapshot.data.data);
            return LqrFutureBuilder(
              snapshot: snapshot,
              content: () => SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    homeBanner,
                    homeFloor,
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget get homeBanner => Container(
        width: Lqr.ui.screenUtil.screenWidth,
        height: Lqr().width(375),
        child: Swiper(
            itemBuilder: (BuildContext context, int i) {
              return Stack(
                children: <Widget>[
                  LqrImage(width: 0.1, height: 375, src: _model.banner[i].image),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      width: Lqr.ui.screenUtil.screenWidth,
                      height: Lqr.ui.width(60),
                      padding: Lqr.ui.edgeL(10),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [Color(0x95000000), Color(0x00000000)], begin: Alignment.bottomCenter, end: Alignment.topCenter),
                      ),
                      child: Text(_model.banner[i].title, style: TextStyle(color: Colors.white, fontSize: Lqr.ui.size(24))),
                    ),
                  )
                ],
              );
            },
            autoplay: _model.banner.length == 1 ? false : true,
            itemCount: _model.banner.length,
            pagination: SwiperPagination(margin: Lqr().edgeB(0), builder: SwiperPaginationItem()),
            onTap: (int i) => lqrRouter(Routes.comicDetail(id: _model.banner[i].id))),
      );

  int floorIndex = 0;
  Widget get homeFloor => Column(
        children: <Widget>[
          for (var i = 0; i < _model.floor.length; i++)
            Column(
              children: <Widget>[
                Container(
                  padding: Lqr.ui.edgeLR(Lqr.ui.edgeBa),
                  margin: Lqr.ui.edge(top: 30, bottom: 20),
                  child: Row(
                    children: <Widget>[
                      Image.asset('assets/images/comic_home${floorIndex++ >= 6 ? floorIndex = 1 : floorIndex = floorIndex++}.png', width: Lqr.ui.width(60), height: Lqr.ui.width(56)),
                      Text('   ${_model.floor[i].title}', style: TextStyle(fontSize: Lqr.ui.size(30), fontWeight: FontWeight.bold)),
                      Expanded(child: Text('   ${_model.floor[i].summary}', style: TextStyle(fontSize: Lqr.ui.size(24), color: Lqr.ui.textC3))),
                      GestureDetector(
                        child: Text('更多', style: TextStyle(fontSize: Lqr.ui.size(24), color: Lqr.ui.textC3)),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _model.floor[i].floorLists
                        .map(
                          (e) => GestureDetector(
                            onTap: () => lqrRouter(Routes.comicDetail(id: e.id)),
                            child: Container(
                              width: Lqr.ui.width(215),
                              margin: Lqr.ui.edgeL(Lqr.ui.edgeBa),
                              padding: Lqr.ui.edgeB(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: Lqr.ui.borderRadius(),
                                    child: Stack(
                                      children: <Widget>[
                                        LqrImage(width: 215, height: 280, src: e.image),
                                        // Image.network(e.image),
                                        Positioned(
                                          bottom: 0,
                                          left: 0,
                                          child: Container(
                                            padding: Lqr.ui.edgeLR(10),
                                            alignment: Alignment.centerRight,
                                            width: Lqr.ui.width(215),
                                            height: Lqr.ui.width(40),
                                            color: Colors.black38,
                                            child: Text(e.chapter, style: TextStyle(fontSize: Lqr.ui.size(24), color: Colors.white)),
                                          ),
                                        ),
                                        Positioned(
                                          right: 0,
                                          top: 0,
                                          child: Container(
                                            padding: Lqr.ui.edgeLR(15),
                                            color: Colors.black38,
                                            child: Text(e.score, style: TextStyle(fontSize: Lqr.ui.size(24), color: Colors.white)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(height: Lqr.ui.width(10)),
                                  Text(e.title, maxLines: 1, style: TextStyle(fontSize: Lqr.ui.size(28), color: Lqr.ui.textC1)),
                                  Container(height: Lqr.ui.width(10)),
                                  Text(e.desc, maxLines: 1, style: TextStyle(fontSize: Lqr.ui.size(24), color: Lqr.ui.textC3)),
                                ],
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                Lqr.ui.intervalWidget(height: 20),
              ],
            ),
        ],
      );
}
