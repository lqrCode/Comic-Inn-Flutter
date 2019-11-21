import 'package:flutter_lqrui/lqr_common/lqr_common.dart';

class LqrPickerImage extends StatefulWidget {
  // 基础属性
  final int maxImages;
  final Function(List<MapEntry<String, MultipartFile>> val) callback;
  // form属性
  final title;
  final hintText;
  final enabled;
  LqrPickerImage({
    Key key,
    // 基础属性
    this.maxImages,
    this.callback,
    // form属性
    this.title,
    this.hintText,
    this.enabled = true,
  }) : super(key: key);
  @override
  _LqrPickerImageState createState() => new _LqrPickerImageState();
}

class _LqrPickerImageState extends State<LqrPickerImage> {
  List<Asset> imageAsset = List<Asset>();
  List<MapEntry<String, MultipartFile>> files = [];

  //多图选择器
  Future pickImage() async {
    try {
      var requestList = await MultiImagePicker.pickImages(
        maxImages: widget.maxImages,
        enableCamera: true,
        selectedAssets: imageAsset,
        materialOptions: MaterialOptions(
          actionBarTitle: "选择图片",
          allViewTitle: "全部图片",
          // actionBarColor: "#aaaaaa",
          // actionBarTitleColor: "#bbbbbb",
          lightStatusBar: false,
          // statusBarColor: '#abcdef',
          // startInAllView: true,
          textOnNothingSelected: "请选择图片",
          // selectCircleStrokeColor: "#000000",
          selectionLimitReachedText: "最多选择${widget.maxImages}张图片",
        ),
      );
      if (!mounted) return;
      if (requestList.length != 0) {
        setState(() {
          imageAsset = requestList;
        });
        files.clear();
        for (int i = 0; i < requestList.length; i++) {
          ByteData byteData = await requestList[i].getByteData(quality: 80);
          List<int> imageData = byteData.buffer.asUint8List();
          String fileName = "${Uuid().v1()}.png";
          files.add(MapEntry(
            "files",
            MultipartFile.fromBytes(imageData, filename: fileName),
          ));
          // files.add(MultipartFile.fromBytes(imageData, filename: fileName));
        }
        widget.callback(files);
      }
    } catch (e) {
      // lqrShowToast("操作失败：" + e.toString());
    }
  }

  Widget content() {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: Lqr.ui.width(10),
        crossAxisSpacing: Lqr.ui.width(10),
        // childAspectRatio: 2.8, //框的比列
      ),
      itemCount: imageAsset.length < widget.maxImages ? imageAsset.length + 1 : imageAsset.length,
      itemBuilder: (BuildContext context, int i) {
        int imgIndex = imageAsset.length < widget.maxImages ? i - 1 : i;
        return i == 0 && imageAsset.length < widget.maxImages
            ? GestureDetector(onTap: pickImage, child: Image.asset("assets/images/pickImage.png", fit: BoxFit.fill))
            : GestureDetector(
                onTap: pickImage,
                onLongPress: () {
                  return showDialog<void>(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('删除此图片'),
                        actions: <Widget>[
                          FlatButton(child: Text('取消'), onPressed: () => Navigator.of(context).pop()),
                          FlatButton(
                            child: Text('删除'),
                            onPressed: () {
                              Navigator.of(context).pop();
                              setState(() {
                                imageAsset.removeAt(imgIndex);
                                files.removeAt(imgIndex);
                                widget.callback(files);
                              });
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: AssetThumb(asset: imageAsset[imgIndex], width: 300, height: 300),
              );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.title == null) {
      return content();
    } else {
      return Container(
        alignment: Alignment.centerLeft,
        padding: Lqr.ui.edgeA(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: Lqr.ui.edgeB(10),
              child: Text(widget.title, style: TextStyle(fontSize: Lqr.ui.size(30))),
            ),
            widget.hintText != null
                ? Container(
                    margin: Lqr.ui.edgeB(10),
                    child: Text(
                      "${widget.hintText}  (长按删除图片)",
                      style: TextStyle(fontSize: Lqr.ui.size(24), color: Lqr.ui.textC2),
                    ),
                  )
                : Container(),
            content(),
          ],
        ),
      );
    }
  }
}
