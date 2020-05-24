import 'package:SpaceFix/AppCustomization/ColorCatalog.dart';
import 'package:SpaceFix/RepairStations/RepairStationsWidget.dart';
import 'package:flutter/material.dart';
import 'package:SpaceFix/SpaceshipComponents/SpaceshipComponentsWidget.dart';
import 'package:SpaceFix/RepairStations/RepairStationsWidget.dart';

void main() => runApp(SpaceFixApp());

class SpaceFixApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Space Fix",
      home: MainWidget() ,
    );
  }
}

class MainWidget extends StatefulWidget {
  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {

  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static List<Widget> widgetOptions = <Widget>[
    SpaceshipComponentsWidget(),
    RepairStationsWidget()
  ];

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const<BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.build),
            title: Text('Buisness'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.all_inclusive),
            title: Text('RepairStations')
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.black,

        onTap: onItemTapped,
      ),
    );
  }
}
