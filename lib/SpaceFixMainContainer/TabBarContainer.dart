import 'package:SpaceFix/RepairStations/RepairStationsView/RepairStationsWidget.dart';
import 'package:SpaceFix/RepairStations/RepairStationsViewModel/RepairStationsViewModel.dart';
import 'package:flutter/material.dart';
import 'package:SpaceFix/SpaceshipComponents/SpaceshipComponentsWidget.dart';
import 'package:SpaceFix/AppCustomization/StringCatalog.dart';
import 'package:SpaceFix/AppCustomization/AppConfigurationCatalog.dart';
import 'package:provider/provider.dart';

class TabBarContainerWidget extends StatefulWidget {
  @override
  _TabBarContainerWidgetState createState() => _TabBarContainerWidgetState();
}

class _TabBarContainerWidgetState extends State<TabBarContainerWidget> {
  /*
   TabBar Items
   */

  /// Current Selected Index
  int _selectedIndex = 0;

  /// Widget List associated for tab bar items
  static List<Widget> _widgetOptions = <Widget>[
    SpaceshipComponentsWidget(),
    ProvidedRepairStationWidget()
  ];

  /*
  Private Methods
   */

  /// Action for selected TabBar Item
  void _onTabBarItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  /*
   Custom Widget Components
   */

  BorderRadius _tabBarBorderRadius = BorderRadius.only(
      topRight: Radius.circular(24), topLeft: Radius.circular(24));

  /// Widget Constructor for the BottomNavigationBar
  Widget _bottomNavigationBar() => Container(
        decoration: BoxDecoration(borderRadius: _tabBarBorderRadius),
        child: ClipRRect(
          borderRadius: _tabBarBorderRadius,
          child: BottomNavigationBar(
            // UI Customization
            backgroundColor: Colors.black,
            selectedItemColor: AppColors.selectedTabBarItemColor,
            unselectedItemColor: AppColors.tabBarItemColor,

            // Tab Bar Items
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.build),
                title: Text(MainStringCatalog.spaceShipComponentsTab),
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.all_inclusive),
                  title: Text(MainStringCatalog.repairStationsTab)
              )
            ],
            currentIndex: _selectedIndex,

            // Tab Bar Actions
            onTap: _onTabBarItemTapped,
          ),
        ),
      );

  /*
  * Build
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }
}

class ProvidedRepairStationWidget extends StatefulWidget {
  @override
  _ProvidedRepairStationWidgetState createState() => _ProvidedRepairStationWidgetState();
}

class _ProvidedRepairStationWidgetState extends State<ProvidedRepairStationWidget> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RepairStationsViewModel>(
        create: (BuildContext context) { return RepairStationsViewModel(); },
        child: RepairStationsWidget()
    );
  }
}
