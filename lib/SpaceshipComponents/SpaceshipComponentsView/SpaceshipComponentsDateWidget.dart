import 'package:flutter/material.dart';
import 'package:SpaceFix/AppCatalogs/AppConfigurationCatalog.dart';
import 'package:SpaceFix/AppCatalogs/StringCatalog.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class SpaceshipComponentsDateWidget extends StatefulWidget {
  @override
  _SpaceshipComponentsDateWidgetState createState() =>
      _SpaceshipComponentsDateWidgetState();
}

class _SpaceshipComponentsDateWidgetState
    extends State<SpaceshipComponentsDateWidget> {
  // Private Properties

  String _date = SpaceshipComponentsStringCatalog.emptyDate;

  // Private Methods

  void _showDatePicker() {
    DatePicker.showDatePicker(
      context,
      theme: DatePickerTheme(
          containerHeight: GeneralConstants.datePickerHeight,
          headerColor: AppColors.mainComponentColor,
          itemStyle: TextStyle(color: AppColors.mainComponentColor),
          doneStyle: TextStyle(
              color: AppColors.titleColor, fontWeight: FontWeight.bold),
          cancelStyle: TextStyle(color: AppColors.titleColor)),
      showTitleActions: true,
      minTime: DateTime(1950, 1, 1),
      maxTime: DateTime(2050, 12, 31),
      currentTime: DateTime.now(),
      locale: LocaleType.en,
      onConfirm: (date) {
        _date = '${date.year} - ${date.month} - ${date.day}';
        setState(() {});
      },
    );
  }

  RaisedButton _buildDateButton() {
    TextStyle _dateButtonTextStyle = TextStyle(
        color: AppColors.titleColor,
        fontWeight: FontWeight.bold,
        fontSize: FontSizes.largeFontSize);

    return RaisedButton(
      onPressed: () {
        _showDatePicker();
      },
      color: AppColors.mainComponentColor,
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(GeneralConstants.smallBorderRadius)),
      child: Container(
        height: GeneralConstants.dateButtonHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(
                  Icons.date_range,
                  size: GeneralConstants.smallIconSize,
                  color: AppColors.titleColor,
                ),
                Text(
                  "$_date",
                  style: _dateButtonTextStyle,
                )
              ],
            ),
            Text(
              SpaceshipComponentsStringCatalog.changeDateButton,
              style: _dateButtonTextStyle,
            )
          ],
        ),
      ),
    );
  }

  // Build

  @override
  Widget build(BuildContext context) {
    return _buildDateButton();
  }
}
