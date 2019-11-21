<!--
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-11-04 17:12:59
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-11-05 11:10:16
 -->

``` dart
<!-- 定义 -->
LqrTreeClaabackData _clientData = LqrTreeClaabackData();

<!-- 使用 -->
 GestureDetector(
  child: FormInputItem(title: '客户', hintText: '请选择客户', controller: _client, enabled: false),
  onTap: () async {
    _clientData = await lqrRouter(
          LqrTree(
            lists: Store.value<ConfigProvide>(Store.storeCtx).clientLists,
            filter: (data, val) => data.name.contains(val) || data.info.containsKey('loginName') && data.info['loginName'].contains(val),
            checkedValue: _clientData.checkedValue,
            isMultiple: false,
            expandAll: true,
          ),
        ) ??
        _clientData;
    setState(() {
      _client.text = _clientData.checkedLists.length > 0 ? _clientData.checkedLists[0].name : '';
    });
  },
),
```