import 'package:flutter/material.dart';

class SpaceshipComponentsWidget extends StatefulWidget {
  @override
  _SpaceshipComponentsWidgetState createState() => _SpaceshipComponentsWidgetState();
}

class _SpaceshipComponentsWidgetState extends State<SpaceshipComponentsWidget> {
  int _currentStep = 0;
  List<Step> _mySteps() {
    List<Step> _steps = [
        Step(
          title: Text('Step 1'),
          content: TextField(),
          isActive: _currentStep >= 0,
        ),
        Step(
          title: Text('Step 2'),
          content: TextField(),
          isActive: _currentStep >= 1,
        ),
        Step(
          title: Text('Step 3'),
          content: TextField(),
          isActive: _currentStep >= 2,
      )
    ];
    return _steps;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Stepper(
        steps: _mySteps(),
        currentStep: this._currentStep,
        type: StepperType.horizontal,
        onStepTapped: (step) {
          setState(() {
            this._currentStep = step;
          });
        },
        onStepContinue: ()  {
          setState(() {
            if(this._currentStep < this._mySteps().length - 1) {
              this._currentStep = this._currentStep + 1;
            } else {
              // Logic to check if everything is completed
              print('Completed, check fields');
            }
          });
        },
        onStepCancel: () {
          setState(() {
            setState(() {
              if(this._currentStep > 0) {
                this._currentStep = this._currentStep - 1;
              } else {
                this._currentStep = 0;
              }
            });
          });
        },
      ),
    );
  }
}