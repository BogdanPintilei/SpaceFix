import 'package:flutter/material.dart';
import 'package:SpaceFix/Models/RepairStation.dart';
import 'package:SpaceFix/Repository/SpaceFixRepository.dart';
import 'RepairStationsViewModelInterface.dart';

/// Concrete implementation for RepairStationsViewModel
class RepairStationsViewModel with ChangeNotifier implements RepairStationViewModelInterface  {

  // Private properties

  List<RepairStation> _repairStationsList = List<RepairStation>();
  List<RepairStation> _initialRepairStationList = List<RepairStation>();

  // Abstract Interface Implementation

  @override
  void viewWasLoaded() {
    _fetchRepairStationsList();
  }

  @override
  int numberOfRepairStations() {
    return _repairStationsList.length;
  }

  @override
  RepairStation repairStationForIndex(int index) {
    if (_repairStationsList.asMap().containsKey(index)) {
      return  _repairStationsList[index];
    }
  }

  @override
  void sortListBy(SortType sortType) {
    switch(sortType) {
      case SortType.price:
        {
          _repairStationsList.sort((a,b) => a.price.compareTo(b.price));
        }
        break;
      case SortType.rating:
        {
          _repairStationsList.sort((a,b) => a.rating.compareTo(b.rating));
        }
        break;
      case SortType.time:
        {
          _repairStationsList.sort((a,b) => a.averageRepairDuration.compareTo(b.averageRepairDuration));
        }
        break;
      case SortType.initial:
        {
          _resetList();
        }
        break;
    }
    notifyListeners();
  }

  @override
  void searchListForQuery(String query) {
    List<RepairStation> dummySearchList = List<RepairStation>();
    dummySearchList.addAll(_repairStationsList);
    if(query.isNotEmpty) {
      List<RepairStation> dummyListData = List<RepairStation>();
      dummySearchList.forEach((item) {
        if(item.name.toLowerCase().contains(query.toLowerCase().trim())) {
          dummyListData.add(item);
        }
      });
      _repairStationsList.clear();
      _repairStationsList.addAll(dummyListData);
    } else {
        _resetList();
    }
    notifyListeners();
  }

  // Private  methods

  void _fetchRepairStationsList() {
    _repairStationsList.clear();
    _repairStationsList.addAll(SpaceFixRepository.repairStations);
    _initialRepairStationList.clear();
    _initialRepairStationList.addAll(SpaceFixRepository.repairStations);
  }

  void _resetList() {
    _repairStationsList.clear();
    _repairStationsList.addAll(_initialRepairStationList);
  }

}