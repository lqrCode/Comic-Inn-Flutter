<!--
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-11-11 16:43:30
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-11-11 16:45:47
 -->

``` dart
LqrDialogSelectListsModel _meterType = LqrDialogSelectListsModel(); // 仪表类型
List<LqrDialogSelectListsModel> operationStatus = []; //运营状态
operationStatus = LqrDialogSelectModel.fromJson({"lists": config.data['operation_status']}).lists;

lqrDialogSelect(
    list: operationStatus,
    dialogTitle: '请选择仪表类型',
    callback: (val) => setState(() => _meterType = val),
),
```