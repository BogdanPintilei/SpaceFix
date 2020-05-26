import 'package:flutter/material.dart';
import 'package:SpaceFix/AppCatalogs/AppConfigurationCatalog.dart';
import 'package:SpaceFix/SpaceFixMainContainer/TabBarContainer.dart';

/// Main Container + General App Configuration
class SpaceFixApp extends StatelessWidget {
  // Build
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: AppColors.colouredFontColor,
      ),
      home: TabBarContainerWidget(),
    );
  }
}
