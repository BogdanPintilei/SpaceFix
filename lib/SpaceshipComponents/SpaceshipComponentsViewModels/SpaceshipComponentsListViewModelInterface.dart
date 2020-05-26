import 'package:SpaceFix/Models/SpaceshipComponent.dart';

/// Abstract Type responsible for SpaceshipComponentsListViewWidget duties
abstract class SpaceshipComponentsListViewModelInterface {

  /// Method which returns number of spaceship components
  int numberOfComponents();

  /// Method which returns a spaceship component for a given index
  SpaceshipComponent componentForIndex(int index);

  /// Method which add a spaceship component with a received parameter name
  void addSpaceshipComponentWithName(String name);

  /// Method which checks and returns if the latest component is valid
  bool isSpaceshipComponentValid();

  /// Method which deletes a component at a given index
  void deleteSpaceshipComponentAtIndex(int index);
}