import 'package:flutter_lqrui/lqr_common/lqr_common.dart';

class LqrImagePreview extends StatelessWidget {
  final list;
  final index;
  const LqrImagePreview({Key key, this.list, this.index}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black87, elevation: 0),
      body: Container(
        child: PhotoViewGallery(
          pageController: PageController(initialPage: index),
          pageOptions: _buildList(list),
          backgroundDecoration: BoxDecoration(color: Colors.black87),
          // index:1,
        ),
      ),
    );
  }
}

List<PhotoViewGalleryPageOptions> _buildList(list) {
  return List.generate(
    list.length,
    (int index) => PhotoViewGalleryPageOptions(
      imageProvider: NetworkImage(list[index]),
      // heroTag: "tag$index",
      heroAttributes: PhotoViewHeroAttributes(tag: index),
    ),
  );
}
