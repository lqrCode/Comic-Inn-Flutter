/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-07-13 11:03:02
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-10-19 16:13:29
 */
package code.inn.lqrui;

import android.os.Bundle;
import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;

import android.view.KeyEvent;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {
	//通讯名称,回到手机桌面
  private  final String CHANNEL = "android/back/desktop";

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);
		// if(Build.VERSION.SDK_INT>=Build.VERSION_CODES.LOLLIPOP){
    //   //API>21,设置状态栏颜色透明
		//   getWindow().setStatusBarColor(0);
		// }
		new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(
			new MethodChannel.MethodCallHandler() {
				@Override
				public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
					if (methodCall.method.equals("backDesktop")) {
            result.success(true);
            moveTaskToBack(false);
					} 
				}
			}
    );
  }
}
