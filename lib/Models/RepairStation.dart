
/// Model used to represent an Intergalactic Repair Station

class RepairStation {

  final String name;
  final String stationImageURL;
  final String galaxy;
  final double rating;
  final double price;
  final double averageRepairDuration;

  //  Initializer

  RepairStation(
    this.name,
    this.stationImageURL,
    this.galaxy,
    this.rating,
    this.price,
    this.averageRepairDuration
  );

}