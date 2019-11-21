<!--
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-11-11 15:40:18
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-11-11 15:40:41
 -->

``` dart
LqrSearch(
    hintText: "输入客户名称搜索",
    onChanged: (val) => _searchVal = val,
    onTap: () => loadingController.callRefresh(),
),
```