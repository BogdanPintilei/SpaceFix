import 'package:flutter/material.dart';
import 'package:SpaceFix/AppCatalogs/AppConfigurationCatalog.dart';
import 'package:SpaceFix/AppCatalogs/StringCatalog.dart';
import 'SpaceshipComponentsDateWidget.dart';
import 'SpaceshipComponentsListViewWidget.dart';

class SpaceshipComponentsWidget extends StatefulWidget {
  @override
  _SpaceshipComponentsWidgetState createState() =>
      _SpaceshipComponentsWidgetState();
}

class _SpaceshipComponentsWidgetState extends State<SpaceshipComponentsWidget> {
  // Private Properties

  int _currentStep = 0;

  BorderRadius _tabBarBorderRadius =
      BorderRadius.vertical(bottom: Radius.circular(GeneralConstants.mediumBorderRadius));
  TextStyle instructionTextStyle = TextStyle(
      fontSize: FontSizes.mediumFontSize,
      fontWeight: FontWeight.bold,
      color: AppColors.colouredFontColor);

  // Private Methods

  AppBar _buildCustomAppBar() {
    return AppBar(
        shape: RoundedRectangleBorder(borderRadius: _tabBarBorderRadius),
        title: Text(
          SpaceshipComponentsStringCatalog.componentsWidgetTitle,
          style: TextStyle(
            color: AppColors.titleColor,
          ),
        ),
        backgroundColor: AppColors.mainComponentColor);
  }

  Widget _buildCustomStepper() {
    EdgeInsets marginInsets = EdgeInsets.only(
        top: GeneralConstants.mediumEdgeInset,
        bottom: GeneralConstants.mediumEdgeInset);

    List<Step> _steps = [
      Step(
          isActive: true,
          title: Text(SpaceshipComponentsStringCatalog.step1),
          content: Container(
              child: Column(children: <Widget>[
            Text(
              SpaceshipComponentsStringCatalog.step1Instructions,
              style: instructionTextStyle,
            ),
            Container(
                margin: marginInsets,
                child: ProvidedSpaceshipComponentsTableViewWidget())
          ]))),
      Step(
        isActive: true,
        title: Text(SpaceshipComponentsStringCatalog.step2),
        content: Container(
          child: Column(
            children: <Widget>[
              Text(
                SpaceshipComponentsStringCatalog.step2Instructions,
                style: instructionTextStyle,
              ),
              Container(
                  margin: marginInsets, child: SpaceshipComponentsDateWidget())
            ],
          ),
        ),
      ),
    ];

    return Stepper(
      type: StepperType.vertical,
      currentStep: _currentStep,
      steps: _steps,
      onStepTapped: (step) {
        setState(() {
          _currentStep = step;
        });
      },
      onStepContinue: () {
        setState(() {
          if (_currentStep < _steps.length - 1) {
            _currentStep++;
          } else {
            _currentStep = 0;
          }
        });
      },
      onStepCancel: () {
        setState(() {
          if (_currentStep > 0) {
            _currentStep--;
          } else {
            _currentStep = 0;
          }
        });
      },
    );
  }

  // Build

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildCustomAppBar(),
        body: Container(
          child: _buildCustomStepper(),
        ));
  }
}
