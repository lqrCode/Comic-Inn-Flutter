#import "FlutterLqruiPlugin.h"
#import <flutter_lqrui/flutter_lqrui-Swift.h>

@implementation FlutterLqruiPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterLqruiPlugin registerWithRegistrar:registrar];
}
@end
