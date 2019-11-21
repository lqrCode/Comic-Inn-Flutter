import 'package:flutter_lqrui/lqr_common/lqr_common.dart';
export './lqr_dialog_select_model.dart';

void lqrDialogSelect({
  List<LqrDialogSelectListsModel> list,
  Function(LqrDialogSelectListsModel) callback,
  String dialogTitle = "请选择",
}) {
  showDialog<Null>(
    context: Lqr.ui.scaffoldCtx,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: Text(dialogTitle),
        children: list.map((val) {
          return SimpleDialogOption(
            child: Container(
              alignment: Alignment.centerLeft,
              height: Lqr.ui.width(40),
              child: Text(val.name, style: TextStyle(color: Colors.black87)),
            ),
            onPressed: () {
              if (callback != null) callback(val);
              Navigator.of(context).pop();
            },
          );
        }).toList(),
      );
    },
  );
}
