import 'package:provider/provider.dart';

export 'config.dart';
import 'config.dart';


export 'routes_config.dart';
class Store {
  static dynamic storeCtx;
  static dynamic widgetCtx;
  static dynamic scaffoldCtx;

  static init({model, child, dispose = true}) {
    return MultiProvider(
      providers: [
        Provider<ConfigProvide>.value(value: ConfigProvide()),
      ],
      child: child,
    );
  }

  static setStoreCtx(context) {
    storeCtx = context;
  }

  static setWidgetCtx(context) {
    widgetCtx = context;
  }

  static setScaffoldCtx(context) {
    scaffoldCtx = context;
  }

  static T valueNotCtx<T>() {
    return Provider.of<T>(storeCtx);
  }

  static T value<T>(context, {scope}) {
    return Provider.of<T>(context);
  }

  static connect<T>({builder, child, scope}) {
    return Consumer<T>(builder: builder, child: child);
  }
}
