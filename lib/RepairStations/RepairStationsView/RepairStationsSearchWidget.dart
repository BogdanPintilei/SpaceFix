import 'package:SpaceFix/AppCustomization/AppConfigurationCatalog.dart';
import 'package:SpaceFix/AppCustomization/StringCatalog.dart';
import 'package:SpaceFix/RepairStations/RepairStationsViewModel/RepairStationsViewModelInterface.dart';
import 'package:flutter/material.dart';

class RepairStationsSearchWidget extends StatefulWidget {
  RepairStationViewModelInterface viewModel;
  RepairStationsSearchWidget(this.viewModel);
  @override
  _RepairStationsSearchWidgetState createState() => _RepairStationsSearchWidgetState();
}

class _RepairStationsSearchWidgetState extends State<RepairStationsSearchWidget> {

  // Private properties

  TextEditingController _editingController = TextEditingController();

  OutlineInputBorder _customBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white),
    borderRadius: BorderRadius.circular(GeneralConstants.mediumBorderRadius),
  );

  BorderRadius _tabBarBorderRadius = BorderRadius.only(
      bottomLeft: Radius.circular(GeneralConstants.mediumBorderRadius),
      bottomRight: Radius.circular(GeneralConstants.mediumBorderRadius));

  TextStyle _searchTextSytle = TextStyle(color: AppColors.titleFontColor);

  // Private methods

  Widget _buildSearchSection(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.mainComponentColor,
          borderRadius: _tabBarBorderRadius),
      child: Padding(
        padding: EdgeInsets.all(GeneralConstants.smallEdgeInset),
        child: TextField(
          style: _searchTextSytle,
          decoration: InputDecoration(
            labelText: RepairStationsStringCatalog.searchPlaceholder,
            hintText: RepairStationsStringCatalog.searchHint,
            labelStyle: _searchTextSytle,
            hintStyle: _searchTextSytle,
            enabledBorder: _customBorder,
            focusedBorder: _customBorder,
            border: _customBorder,
          ),
          controller: _editingController,
          onChanged: (value) {
            this.widget.viewModel.searchListForQuery(value);
          },
        ),
      ),
    );
  }

  // Build
  @override
  Widget build(BuildContext context) {
    return _buildSearchSection(context);
  }

}