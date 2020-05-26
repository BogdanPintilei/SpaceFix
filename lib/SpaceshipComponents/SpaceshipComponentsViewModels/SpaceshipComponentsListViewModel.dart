import 'package:SpaceFix/Models/SpaceshipComponent.dart';
import 'package:flutter/material.dart';

abstract class SpaceshipComponentsListViewModelInterface {


  int numberOfComponents();

  SpaceshipComponent componentForIndex(int index);

  addSpaceshipComponentWithName(String name);

  deleteSpaceshipComponentAtIndex(int index);

  bool isSpaceshipComponentValid();

}

class SpaceshipComponentsListViewModel extends ChangeNotifier implements SpaceshipComponentsListViewModelInterface {

  List<SpaceshipComponent> _componentsList = List<SpaceshipComponent>();
  bool _isInputSpaceshipComonentValid = true;

  bool _validateSpaceshipComponent(String name) {
    _isInputSpaceshipComonentValid = name.isNotEmpty;
    return _isInputSpaceshipComonentValid;
  }

  @override
  SpaceshipComponent componentForIndex(int index) {
    if(_componentsList.asMap().containsKey(index)) {
      return _componentsList[index];
    }
  }

  @override
  addSpaceshipComponentWithName(String name) {
    if  (_validateSpaceshipComponent(name)) {
      _componentsList.add(SpaceshipComponent(name));
    }
    notifyListeners();
  }

  @override
  deleteSpaceshipComponentAtIndex(int index) {
    if(_componentsList.asMap().containsKey(index)) {
      _componentsList.removeAt(index);
      notifyListeners();
    }
  }

  @override
  int numberOfComponents() {
    return _componentsList.length;
  }

  @override
  bool isSpaceshipComponentValid() {
    return _isInputSpaceshipComonentValid;
  }

}