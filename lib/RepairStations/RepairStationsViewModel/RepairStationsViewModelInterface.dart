import 'package:SpaceFix/Models/RepairStation.dart';

/// Type Used to represent sorting options for RepairStations Widget
enum SortType {
  price,
  time,
  rating,
  initial
}

/// Abstract Type responsible for RepairStation duties
abstract class RepairStationViewModelInterface {

  /// Event that represent that view is ready for presentation logic
  void viewWasLoaded();

  /// Method which returns the number of available Repair Stations
  int numberOfRepairStations();

  /// Method used for organizing the displayed Repair Stations list
  void sortListBy(SortType sortType);

  /// Method which filters through the Repair Stations list
  void searchListForQuery(String query);

  /// Method which returns a station from the Repair Stations list for a given index
  RepairStation repairStationForIndex(int index);

}
