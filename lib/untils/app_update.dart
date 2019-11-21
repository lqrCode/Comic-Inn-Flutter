import 'package:ComicInn/common/common.dart';
import 'package:ComicInn/models/app_update_model.dart';

import 'package:package_info/package_info.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';

//检查是否有更新
Future checkUpdate({type: 1}) async {
  try {
    var res = await lqrHttp(LqrApis.updateApp, 'POST');
    AppUpdateModel appUpdateModel = AppUpdateModel.fromJson(res.data);
    if (appUpdateModel.lists[0].buildNumber > int.parse(Store.value<ConfigProvide>(Store.storeCtx).packageInfo.buildNumber)) {
      updateDialog(appUpdateModel.lists[0]);
      Store.value<ConfigProvide>(Store.storeCtx).setAppUpdate(true, appUpdateModel.lists[0].version);
    } else {
      if (type == 2) Lqr.ui.toast('已是最新版本！');
    }
  } catch (e) {
    print('++++++++++++++++++++++++++++++检查是否有更新');
    print(e);
    print('++++++++++++++++++++++++++++++检查是否有更新');
  }
}

// 检查是否有权限
checkPermission() async {
  //检查是否已有读写内存权限
  PermissionStatus status = await PermissionHandler().checkPermissionStatus(PermissionGroup.storage);
  //判断如果还没拥有读写权限就申请获取权限
  if (status != PermissionStatus.granted) {
    var map = await PermissionHandler().requestPermissions([PermissionGroup.storage]);
    if (map[PermissionGroup.storage] != PermissionStatus.granted) {
      return false;
    }
  }
}

void updateDialog(data) {
  showDialog(
    context: Store.scaffoldCtx,
    builder: (context) {
      return DownloadProgressDialog(
        content: data.content,
        url: data.file,
        version: data.version,
      );
    },
  );
}

class DownloadProgressDialog extends StatefulWidget {
  final String version;
  final String url;
  final String content;
  DownloadProgressDialog({Key key, this.version, this.url, this.content}) : super(key: key);
  _DownloadProgressDialogState createState() => _DownloadProgressDialogState();
}

class _DownloadProgressDialogState extends State<DownloadProgressDialog> {
  int _progress = 0;
  String _taskId;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(Lqr.ui.width(7)),
            clipBehavior: Clip.antiAlias,
            child: Material(
              color: Colors.white,
              child: Container(
                width: Lqr.ui.width(300),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Image.asset('assets/images/gs_bg.jpg', fit: BoxFit.cover),
                        Positioned(
                          left: Lqr.ui.width(20),
                          top: Lqr.ui.width(20),
                          child: Text(
                            '发现新版本',
                            style: TextStyle(color: Colors.white, fontSize: Lqr.ui.size(24), fontWeight: FontWeight.w700),
                          ),
                        ),
                        Positioned(
                          left: Lqr.ui.width(25),
                          top: Lqr.ui.width(60),
                          child: Text(
                            widget.version,
                            style: TextStyle(color: Colors.white, fontSize: Lqr.ui.size(22)),
                          ),
                        ),
                      ],
                    ),
                    _progress > 0 ? updateNow() : updateContent(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget updateNow() {
    return Container(
      padding: Lqr.ui.edgeA(20),
      child: Column(
        children: <Widget>[
          Text("下载进度$_progress%"),
          Container(
            margin: Lqr.ui.edge(top: 15, bottom: 10),
            child: LinearProgressIndicator(
              backgroundColor: Colors.grey[100],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          ),
          _progress == 100
              ? InkWell(
                  child: Container(
                    padding: Lqr.ui.edgeTB(10),
                    alignment: Alignment.center,
                    child: Text('立即安装', style: TextStyle(color: Lqr.ui.textC3)),
                  ),
                  onTap: () {
                    LqrDownloader().openDownload(_taskId);
                  },
                )
              : Container(),
        ],
      ),
    );
  }

  Widget updateContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding: Lqr.ui.edgeLR(20),
          margin: Lqr.ui.edgeB(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('更新内容', style: TextStyle(color: Lqr.ui.textC4, height: Lqr.ui.width(1.6), fontSize: Lqr.ui.size(18), fontWeight: FontWeight.w700)),
              Text(widget.content, style: TextStyle(color: Lqr.ui.textC3, height: Lqr.ui.width(1.6), fontSize: Lqr.ui.size(15))),
            ],
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: InkWell(
                child: Container(
                  padding: Lqr.ui.edgeTB(10),
                  alignment: Alignment.center,
                  child: Text('下次再说', style: TextStyle(color: Lqr.ui.textC2)),
                ),
                onTap: () {
                  Navigator.of(Store.scaffoldCtx, rootNavigator: true).pop();
                },
              ),
            ),
            Expanded(
              child: InkWell(
                child: Container(
                  padding: Lqr.ui.edgeTB(10),
                  alignment: Alignment.center,
                  child: Text('立即更新', style: TextStyle(color: Lqr.ui.textC3)),
                ),
                onTap: () async {
                  await checkPermission();
                  executeDownload(widget.url);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> executeDownload(String url) async {
    final path = await LqrDownloader().downloadPath();
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    _taskId = await FlutterDownloader.enqueue(url: url, fileName: '${packageInfo.appName}.apk', savedDir: path, showNotification: false, openFileFromNotification: false);
    FlutterDownloader.registerCallback((id, status, progress) {
      setState(() {
        _progress = progress;
      });
      if (_taskId == id && status == DownloadTaskStatus.complete) {
        LqrDownloader().openDownload(_taskId);
      }
    });
  }
}

class DownCallback {
  String id;
  int progress;
  String taskId;
}

class LqrDownloader {
  // 安装
  Future openDownload(taskId) async {
    FlutterDownloader.open(taskId: taskId);
  }

  // 创建下载
  Future<void> executeDownload(
    String url,
    String fileName, {
    callback,
    String savedDir: '/',
    bool toast = false,
  }) async {
    if (toast) Lqr.ui.toast('下载中');
    final path = await LqrDownloader().downloadPath();
    final taskId = await FlutterDownloader.enqueue(url: url, fileName: fileName, savedDir: path, showNotification: true, openFileFromNotification: true);
    FlutterDownloader.registerCallback((id, status, progress) {
      if (toast && progress == -1) Lqr.ui.toast('下载失败');
      final downCallback = DownCallback();
      downCallback.id = id;
      downCallback.progress = progress;
      downCallback.taskId = taskId;
      callback(downCallback);
    });
  }

  // 路径
  Future<String> downloadPath() async {
    final dir = await getExternalStorageDirectory();
    var directory = await new Directory(dir.path).create(recursive: true);
    return directory.path;
  }

  // 恢复下载
  Future resumeDown(taskId) async {
    FlutterDownloader.resume(taskId: taskId);
  }
}
