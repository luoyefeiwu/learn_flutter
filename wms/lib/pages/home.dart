// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/cupertino.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter_gen/gen_l10n/gallery_localizations.dart';
// import 'package:gallery/constants.dart';
// import 'package:gallery/data/demos.dart';
// import 'package:gallery/data/gallery_options.dart';
// import 'package:gallery/layout/adaptive.dart';
// import 'package:gallery/pages/category_list_item.dart';
// import 'package:gallery/pages/settings.dart';
// import 'package:gallery/pages/splash.dart';
// import 'package:gallery/studies/crane/colors.dart';
// import 'package:gallery/studies/crane/routes.dart' as crane_routes;
// import 'package:gallery/studies/fortnightly/routes.dart' as fortnightly_routes;
// import 'package:gallery/studies/rally/colors.dart';
// import 'package:gallery/studies/rally/routes.dart' as rally_routes;
// import 'package:gallery/studies/reply/routes.dart' as reply_routes;
// import 'package:gallery/studies/shrine/colors.dart';
// import 'package:gallery/studies/shrine/routes.dart' as shrine_routes;
// import 'package:gallery/studies/starter/routes.dart' as starter_app_routes;
// import 'package:url_launcher/url_launcher.dart';

const _horizontalPadding = 32.0;
const _horizontalDesktopPadding = 81.0;
const _carouselHeightMin = 240.0;
const _carouselItemDesktopMargin = 8.0;
const _carouselItemMobileMargin = 4.0;
const _carouselItemWidth = 296.0;

class ToggleSplashNotification extends Notification {}

class _BackButtonHeroTag {}
