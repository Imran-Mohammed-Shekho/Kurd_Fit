import 'package:flutter/services.dart';

void openUrlMobile(url) {
  const platform = MethodChannel("open_browser");
  platform.invokeMethod("openUrl", {"url": url});
}
