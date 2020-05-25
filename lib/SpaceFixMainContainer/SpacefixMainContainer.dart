import 'package:flutter/material.dart';
import 'package:SpaceFix/SpaceFixMainContainer/TabBarContainer.dart';

/// Main Container + General App Configuration
class SpaceFixApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TabBarContainerWidget(),
    );
  }
}
