import 'dart:io';

// ignore: depend_on_referenced_packages
import 'package:flutter_driver/flutter_driver.dart';
import 'package:integration_test/integration_test_driver_extended.dart';

Future<void> main() async {
  final driver = await FlutterDriver.connect();

  // Screenshot: 保存先のPath
  const baseScreenshotDirPath = 'integration_test/screenshots';

  // Screenshot: フォルダ分けの為のDateTime
  final dateTime = DateTime.now().toString();

  await integrationDriver(
    driver: driver,
    onScreenshot: (
      screenshotName,
      screenshotBytes, [
      args,
    ]) async {
      if (!Directory(baseScreenshotDirPath).existsSync()) {
        await Directory(baseScreenshotDirPath).create();
      }

      if (!Directory('$baseScreenshotDirPath/$dateTime').existsSync()) {
        await Directory('$baseScreenshotDirPath/$dateTime').create();
      }
      final image =
          File('$baseScreenshotDirPath/$dateTime/$screenshotName.png');
      image.writeAsBytesSync(screenshotBytes);

      return true;
    },
    writeResponseOnFailure: true,
  );
}
