import 'dart:core';

import 'package:flutter/material.dart';

import '../router/routes.dart';

class HomeJumpIconUtils {
  static final Map<String, HomeJumpRouteIcon> jumpRouteIconMap = {
    "arrivalNotification": HomeJumpRouteIcon(
      color: Colors.blue,
      routeKey: "",
      iconData: Icons.fire_truck,
      name: '到货通知',
    ),
    "wms_shou_huo": HomeJumpRouteIcon(
      color: Colors.blue,
      routeKey: Routes.receiveConfig,
      iconData: Icons.local_shipping,
      name: '收货',
    ),
    "PackagingHome": HomeJumpRouteIcon(
      color: Colors.blue,
      routeKey: Routes.packingCross,
      iconData: Icons.backpack,
      name: '打包',
    ),
  };

  static HomeJumpRouteIcon getJumpRouteIcon(String code) {
    if (jumpRouteIconMap.containsKey(code)) {
      return jumpRouteIconMap[code] as HomeJumpRouteIcon;
    } else {
      return HomeJumpRouteIcon(
        color: Colors.lightBlue,
        name: '',
        routeKey: '',
        iconData: Icons.car_crash,
      );
    }
  }
}

class HomeJumpRouteIcon {
  final Color color;
  final String name;
  final String routeKey;
  final IconData iconData;

  HomeJumpRouteIcon({
    required this.color,
    required this.name,
    required this.routeKey,
    required this.iconData,
  });
}
