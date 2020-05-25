import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class SpaceshipComponentsWidget extends StatefulWidget {
  @override
  _SpaceshipComponentsWidgetState createState() => _SpaceshipComponentsWidgetState();
}

class _SpaceshipComponentsWidgetState extends State<SpaceshipComponentsWidget> {

  List<String> components = [];
  String _date = "Not set";

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
    ];
    return _steps;
  }

  Widget _typeStep() {

    RaisedButton datebutton = RaisedButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0)),
      elevation: 4.0,
      onPressed: () {
        DatePicker.showDatePicker(context,
            theme: DatePickerTheme(
              containerHeight: 210.0,
            ),
            showTitleActions: true,
            minTime: DateTime(2000, 1, 1),
            maxTime: DateTime(2022, 12, 31), onConfirm: (date) {
              print('confirm $date');
              _date = '${date.year} - ${date.month} - ${date.day}';
              setState(() {});
            }, currentTime: DateTime.now(), locale: LocaleType.en);
      },
      child: Container(
        alignment: Alignment.center,
        height: 50.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.date_range,
                        size: 18.0,
                        color: Colors.teal,
                      ),
                      Text(
                        " $_date",
                        style: TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Text(
              " Change",
              style: TextStyle(
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0),
            ),
          ],
        ),
      ),
      color: Colors.white,
    );

    final myController = TextEditingController();
    TextField componentTextField = TextField(
      decoration: const InputDecoration(helperText: "Enter App ID"),
      style: Theme.of(context).textTheme.body1,
      controller: myController,
    );
    List<Step> _steps = [
      Step(
        title: Text("First Step"),
        content: Container(
          child: Column(
            children: <Widget>[
              Text("Some basic instructions"),
              Row(
                children: <Widget>[
                   Flexible(
                    child:  componentTextField,
                  ),
                  FlatButton(
                    child: Text(
                      "Add"
                    ),
                    onPressed: () {
                      setState(() {
                        components.add(myController.text);
                      });
                    },
                  )
                ],
              ),
              _componentList(),
            ],
          )
        )
      ),
      Step(
        title: Text("Second"),
        content: Container(
          child: Column(
            children: <Widget>[
              Text("Some basic instructions)"),
              datebutton
            ],
          ),
        ),

      ),
    ];
    return Container(
      margin: EdgeInsets.only(top: 10),
      color: Colors.transparent,
      child: Stepper(
        type: StepperType.horizontal,
        currentStep: _currentStep,
        steps: _steps,
        onStepTapped: (step) {
          setState(() {
            _currentStep = step;
          });
        },
        onStepContinue: () {
          setState(() {
          if(_currentStep < _steps.length - 1) {
            _currentStep += 1;
          } else {
            _currentStep = 0;
          }
          });
        },
        onStepCancel: () {
          setState(() {
            if(_currentStep > 0) {
              _currentStep = _currentStep -1;
            } else {
              _currentStep = 0;
            }
          });
        },
      ),
    );
    }

    Widget buildComponentCard(BuildContext context, int index) {
      return Container(
        height: 50,
        child: Card(
          child: Container(
            child: Column(
              children: <Widget>[
                Text(index.toString()),
                Text(components[index])
              ],
            ),
          ),
        ),
      );
    }

    Widget _componentList() {
      return ListView.builder(
          itemCount: components.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) => buildComponentCard(context, index)
      );
    }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            title: Text(
              "Title Please replace1",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.black,
          ),
          backgroundColor: Colors.green,

          body: Container(
            child: _typeStep(),
      )
      );
    }
  }
