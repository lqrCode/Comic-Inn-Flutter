<!--
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-11-11 15:41:28
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-11-11 15:42:30
 -->

``` dart
Future<dynamic> _lqrFutureBuilder;

@override
void initState() {
    _lqrFutureBuilder = lqrHttp(LqrApis.clientDetail, 'POST', data: {'id': widget.id});
    super.initState();
}

FutureBuilder(
    future: _lqrFutureBuilder,
    builder: (context, snapshot) {
        return LqrFutureBuilder(
        snapshot: snapshot,
        content: () {
            _model = ClientDetailModel.fromJson(snapshot.data.data);
            return page();
        },
        );
    },
),
```