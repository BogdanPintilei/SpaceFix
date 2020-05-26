import 'package:flutter/material.dart';
import 'package:SpaceFix/Models/SpaceshipComponent.dart';
import 'package:SpaceFix/SpaceshipComponents/SpaceshipComponentsViewModels/SpaceshipComponentsListViewModelInterface.dart';

/// Concrete implementation for SpaceshipComponentsListViewModelInterface
class SpaceshipComponentsListViewModel extends ChangeNotifier
    implements SpaceshipComponentsListViewModelInterface {
  // Private properties

  List<SpaceshipComponent> _componentsList = List<SpaceshipComponent>();
  bool _isInputSpaceshipComponentValid = true;

  // Private methods

  bool _validateSpaceshipComponent(String name) {
    _isInputSpaceshipComponentValid = name.isNotEmpty;
    return _isInputSpaceshipComponentValid;
  }

  //  Abstract Interface Implementation

  @override
  int numberOfComponents() {
    return _componentsList.length;
  }

  @override
  SpaceshipComponent componentForIndex(int index) {
    if (_componentsList.asMap().containsKey(index)) {
      return _componentsList[index];
    }
    return null;
  }

  @override
  addSpaceshipComponentWithName(String name) {
    if (_validateSpaceshipComponent(name)) {
      _componentsList.add(SpaceshipComponent(name));
    }
    notifyListeners();
  }

  @override
  bool isSpaceshipComponentValid() {
    return _isInputSpaceshipComponentValid;
  }

  @override
  deleteSpaceshipComponentAtIndex(int index) {
    if (_componentsList.asMap().containsKey(index)) {
      _componentsList.removeAt(index);
      notifyListeners();
    }
  }
}
