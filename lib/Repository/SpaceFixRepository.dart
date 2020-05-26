import 'package:SpaceFix/Models/RepairStation.dart';

/// SpaceFix Repository for Mocked Data
class SpaceFixRepository {

  static final List<RepairStation> repairStations = [
      RepairStation(
          "CountOnUs-XYZ",
          "https://i.pinimg.com/originals/a7/24/5c/a7245c8417ffd2e0b9718e3864aa7a7d.jpg",
          "Milky-Way",
          2.1,
          0.1,
          3.2),
      RepairStation(
          "WeHelpYouSit",
          "https://cmckccc.files.wordpress.com/2015/08/screenshot_2014-11-11_09-52-04-0.png",
          "Andromeda",
          2.3,
          4.4,
          4.3),
      RepairStation(
          "FixAShip",
          "https://i.pinimg.com/736x/92/5a/86/925a86c2bcc49adfff4634b15d5a196b--sf.jpg",
          "Canis-Major Overdensity",
          4.0,
          3.2,
          1.2),
      RepairStation(
          "BringShipRelax",
          "https://pbs.twimg.com/media/DdU3ohAW0AATogj.jpg",
          "Centaurus A",
          4.9,
          2.3,
          0.1),
  ];

}