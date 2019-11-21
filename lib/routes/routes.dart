import 'package:ComicInn/common/common.dart';
import 'package:ComicInn/pages/page.dart';

// ++++++++++++++++++++++++||漫画||++++++++++++++++++++++++++++
import 'package:ComicInn/pages/comic/comic_detail.dart';
import 'package:ComicInn/pages/comic/comic_play.dart';

class Routes {
  static page() => Pages();

  // ++++++++++++++++++++++++||漫画||++++++++++++++++++++++++++++
  static comicDetail({String id}) => ComicDetail(id: id);
  static comicPlay({String id, List<Chapter> chapter, int index}) => ComicPlay(id: id, chapter: chapter, index: index);
}
