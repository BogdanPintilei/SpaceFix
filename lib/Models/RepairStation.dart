
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

  // Methods
  String priceScore() {
    if (price > 0 && price < 1.1) {
      return "\$";
    } else if (price > 1 && price < 2.1) {
      return  "\$\$";
    } else if (price > 2 && price < 3.1) {
      return  "\$\$\$";
    } else if (price > 3 && price < 4.1) {
      return  "\$\$\$\$";
    } else if (price > 4 && price < 5.1) {
      return "\$\$\$\$\$";
    }
    return "\$\$\$\$\$+";
  }

  String duration() {
    if (averageRepairDuration > 0 && averageRepairDuration < 1.1) {
      return "Next Year";
    } else if (averageRepairDuration > 1 && averageRepairDuration < 2.1) {
      return  "Months...";
    } else if (averageRepairDuration > 2 && averageRepairDuration < 3.1) {
      return  "3Weeks";
    } else if (averageRepairDuration > 3 && averageRepairDuration < 4.1) {
      return  "1Week+";
    } else if (averageRepairDuration > 4 && averageRepairDuration < 5.1) {
      return "SameDay";
    }
    return "Never";
  }
}
