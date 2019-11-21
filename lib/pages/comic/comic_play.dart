import 'package:ComicInn/common/common.dart';
import 'package:ComicInn/models/comic/comic_play_model.dart';

class ComicPlay extends StatefulWidget {
  final String id;
  final List<Chapter> chapter;
  final int index;
  const ComicPlay({Key key, this.id, this.chapter, this.index}) : super(key: key);
  @override
  _ComicPlayState createState() => _ComicPlayState();
}

class _ComicPlayState extends State<ComicPlay> {
  // List<String> _images = [];
  int _playIndex = 0;
  ScrollController controller;

  @override
  void initState() {
    super.initState();
    _playIndex = widget.index;
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView.builder(
          controller: controller,
          itemCount: widget.chapter[_playIndex].lists.length,
          itemBuilder: (BuildContext context, int i) {
            if (i == 0) {
              return GestureDetector(
                onTap: () {
                  if (_playIndex + 1 != widget.chapter.length) {
                    _playIndex++;
                    getData();
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  width: Lqr.ui.screenUtil.screenWidth,
                  height: Lqr().width(100),
                  color: Color(0xFFf5f5f5),
                  child: Text(_playIndex + 1 == widget.chapter.length ? '已经第一章了' : '上一章：${widget.chapter[_playIndex + 1].name}'),
                ),
              );
            } else if (i == widget.chapter[_playIndex].lists.length - 1) {
              return GestureDetector(
                onTap: () {
                  if (_playIndex != 0) {
                    _playIndex--;
                    getData();
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  width: Lqr.ui.screenUtil.screenWidth,
                  height: Lqr().width(100),
                  color: Color(0xFFf5f5f5),
                  child: Text(_playIndex == 0 ? '已经最后一章了' : '下一章：${widget.chapter[_playIndex - 1].name}'),
                ),
              );
            } else {
              return Image.network(widget.chapter[_playIndex].lists[i]);
            }
          },
        ),
      ),
    );
  }

  Future getData() async {
    try {
      if (widget.chapter[_playIndex].lists.length > 0) return;
      var a = await lqrHttp(LqrApis.comicPlay, "GET", data: {"id": widget.id, "pid": widget.chapter[_playIndex].id});
      ComicPlayModel _model = ComicPlayModel.fromJson(a.data);
      setState(() {
        widget.chapter[_playIndex].lists = _model.images;
      });
    } catch (e) {
      print(e);
    }
  }
}
