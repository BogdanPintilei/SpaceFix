import 'package:flutter/material.dart';
import 'package:SpaceFix/AppCatalogs/StringCatalog.dart';
import 'package:SpaceFix/AppCatalogs/AppConfigurationCatalog.dart';
import 'package:SpaceFix/RepairStations/RepairStationsView/RepairStationsWidget.dart';
import 'package:SpaceFix/SpaceshipComponents/SpaceshipComponentsView/SpaceshipComponentsWidget.dart';

class TabBarContainerWidget extends StatefulWidget {
  @override
  _TabBarContainerWidgetState createState() => _TabBarContainerWidgetState();
}

class _TabBarContainerWidgetState extends State<TabBarContainerWidget> {

   // Private properties

  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    SpaceshipComponentsWidget(),
    ProvidedRepairStationWidget()
  ];

  BorderRadius _tabBarBorderRadius = BorderRadius.only(
      topRight: Radius.circular(GeneralConstants.mediumBorderRadius),
      topLeft: Radius.circular(GeneralConstants.mediumBorderRadius));

  // Private Methods

  void _didSelectTabBarItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Custom Widget Components

  Widget _bottomNavigationBar() => Container(
        decoration: BoxDecoration(borderRadius: _tabBarBorderRadius),
        child: ClipRRect(
          borderRadius: _tabBarBorderRadius,
          child: BottomNavigationBar(
            // UI Customization
            backgroundColor: AppColors.mainComponentColor,
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
            onTap: _didSelectTabBarItem,
            
          ),
        ),
      );

  // Build

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