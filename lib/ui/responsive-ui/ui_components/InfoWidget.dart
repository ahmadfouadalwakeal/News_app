import 'package:flutter/material.dart';
import 'package:ixtask/ui/responsive-ui/functions/getDeviceType.dart';
import 'package:ixtask/ui/responsive-ui/models/DeviceInfo.dart';


class InfoWidget extends StatelessWidget {
  final Widget Function(BuildContext context, DeviceInfo deviceInfo) builder;

  const InfoWidget({super.key, required this.builder});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constrains) {
          var mediaQueryData = MediaQuery.of(context);
          var deviceInfo = DeviceInfo(
            orientation: mediaQueryData.orientation,
            deviceType: getDeviceType(mediaQueryData),
            screenWidth: mediaQueryData.size.width,
            screenHeight: mediaQueryData.size.height,
            localHeight: constrains.maxHeight,
            localWidth: constrains.maxWidth,
          );
          return builder(context, deviceInfo);
        }
    );
  }
}
