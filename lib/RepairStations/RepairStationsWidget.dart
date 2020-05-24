import 'package:SpaceFix/Models/RepairStation.dart';
import 'package:flutter/material.dart';
import 'package:SpaceFix/Models/RepairStation.dart';

class RepairStationsWidget extends StatefulWidget {
  @override
  _RepairStationsWidgetState createState() => _RepairStationsWidgetState();
}

class _RepairStationsWidgetState extends State<RepairStationsWidget> {
  final TEXT_BLACK = Color(0xFF353535);
  Widget _childPopup() => PopupMenuButton<int>(
    itemBuilder: (context) => [
      PopupMenuItem(
        value: 1,
        child: Text(
          "Earth",
          style: TextStyle(
              color: TEXT_BLACK, fontWeight: FontWeight.w700),
        ),
      ),
      PopupMenuItem(
        value: 2,
        child: Text(
          "Moon",
          style: TextStyle(
              color: TEXT_BLACK, fontWeight: FontWeight.w700),
        ),
      ),
      PopupMenuItem(
        value: 3,
        child: Text(
          "Sun",
          style: TextStyle(
              color: TEXT_BLACK, fontWeight: FontWeight.w700),
        ),
      ),
    ],
    onSelected: (value) {
      print("value:$value");
      sortSearchStationsBy(value);
    },
    child: Container(
      width: 64,
      child: Icon(Icons.airplanemode_active),
    ),
  );
  List<RepairStation> initialrepairStationsList = [
    RepairStation(
        "CountOnUs-XYZ",
        "https://i.pinimg.com/736x/92/5a/86/925a86c2bcc49adfff4634b15d5a196b--sf.jpg",
        "Milky-Way",
        2.0,
        3.0,
        5.0),
    RepairStation(
        "WeHelpYouSit",
        "https://i.pinimg.com/736x/92/5a/86/925a86c2bcc49adfff4634b15d5a196b--sf.jpg",
        "Andromeda",
        3.0,
        4.0,
        2.0),
    RepairStation(
        "FixAShip",
        "https://i.pinimg.com/736x/92/5a/86/925a86c2bcc49adfff4634b15d5a196b--sf.jpg",
        "Canis-Major Overdensity",
        4.0,
        3.2,
        5.0),
    RepairStation(
        "BringShipRelax",
        "https://i.pinimg.com/736x/92/5a/86/925a86c2bcc49adfff4634b15d5a196b--sf.jpg",
        "Centaurus A",
        4.9,
        3.6,
        4.2),
  ];

  List<RepairStation> repairStationsList = List<RepairStation>();
  List<RepairStation> sortedStationsList = List<RepairStation>();

  void filterSearchResults(String query) {
    List<RepairStation> dummySearchList = List<RepairStation>();
    dummySearchList.addAll(repairStationsList);
    if(query.isNotEmpty) {
      List<RepairStation> dummyListData = List<RepairStation>();
      dummySearchList.forEach((item) {
        if(item.name.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        repairStationsList.clear();
        repairStationsList.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        repairStationsList.clear();
        repairStationsList.addAll(initialrepairStationsList);
      });
    }
  }

  void sortSearchStationsBy(int value) {
    setState(() {
      switch(value) {
        case 1: {
          sortedStationsList.sort((a,b) => a.price.compareTo(b.price));
          repairStationsList = sortedStationsList;
        }
        break;
        case 2: {
          sortedStationsList.sort((a,b) => a.rating.compareTo(b.rating));
          repairStationsList = sortedStationsList;
        }
        break;
        case 3: {
          sortedStationsList.sort((a,b) => a.averageRepairDuration.compareTo(b.averageRepairDuration));
          repairStationsList = sortedStationsList;
        }
        break;
        default: {
          repairStationsList.clear();
          repairStationsList = initialrepairStationsList;
        }
        break;
      }
    });
  }
  TextEditingController editingController = TextEditingController();
  OutlineInputBorder customBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white),
    borderRadius: BorderRadius.circular(24)
  );
  @override
  void initState() {
    super.initState();
    repairStationsList.addAll(initialrepairStationsList);
    sortedStationsList.addAll(initialrepairStationsList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Title Please replace",
            style: TextStyle(
              color: Colors.white,
            ),
        ),
        actions: <Widget>[
          _childPopup()
        ],
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.lightGreenAccent,
        child: Column(
          children: <Widget>[
            Padding(
             padding: EdgeInsets.all(8.0),
             child: TextField(
               onChanged: (value) {
                 filterSearchResults(value);
               },
               controller: editingController,
               style: TextStyle(
                 color:Colors.brown,
                 backgroundColor: Colors.green,
                 decorationColor: Colors.redAccent
               ),
               decoration: InputDecoration(
                   labelText: "Search",
                   hintText: "Search",
                 enabledBorder: customBorder,
                 focusedBorder: customBorder,
                 border: customBorder,
               ),
               ),
             ),
            Expanded(
              child: ListView.builder(
                  itemCount: repairStationsList.length,
                  itemBuilder: (BuildContext context, int index) =>
                      buildStationsListCard(context, index)
              ),
            ),
          ],
        ),
      )
    );
  }

  Widget buildStationsListCard(BuildContext context, int index) {
    final station = repairStationsList[index];
    TextStyle cardDataTextStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );
    EdgeInsets contentPadding = EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 16);
    return Container(
      color: Colors.cyan,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)
        ),
          color: Colors.yellow,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(station.stationImageURL),
                  fit: BoxFit.cover
              ),
              borderRadius: BorderRadius.circular(16)
          ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 160, 0, 0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white60,
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: contentPadding,
                      child: Row(children: <Widget>[
                        Text(
                          station.name,
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]),
                    ),
                    Padding(
                      padding: contentPadding,
                      child: Row(children: <Widget>[
                        Text(
                            station.averageRepairDuration.toString(),
                            style: cardDataTextStyle,
                        ),
                        Spacer(),
                        Text(
                            station.rating.toString(),
                            style: cardDataTextStyle,
                        ),
                        Spacer(),
                        Text(
                            station.price.toString(),
                            style: cardDataTextStyle,
                        ),
                      ]),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
