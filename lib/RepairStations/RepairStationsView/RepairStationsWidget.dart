import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:SpaceFix/RepairStations/RepairStationsView/RepairStationsSearchWidget.dart';
import 'package:SpaceFix/RepairStations/RepairStationsViewModel/RepairStationsViewModelInterface.dart';
import 'package:SpaceFix/AppCatalogs/AppConfigurationCatalog.dart';
import 'package:SpaceFix/AppCatalogs/StringCatalog.dart';
import 'package:SpaceFix/RepairStations/RepairStationsViewModel/RepairStationsViewModel.dart';
import 'package:SpaceFix/RepairStations/RepairStationsView/RepairStationsTableViewWidget.dart';

/// RepairStationWidget with conformance to ChangeNotifierProvider
class ProvidedRepairStationWidget extends StatefulWidget {
  @override
  _ProvidedRepairStationWidgetState createState() => _ProvidedRepairStationWidgetState();
}

class _ProvidedRepairStationWidgetState extends State<ProvidedRepairStationWidget> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RepairStationsViewModel>(
        create: (BuildContext context) { return RepairStationsViewModel(); },
        child: RepairStationsWidget()
    );
  }
}

/// RepairStationWidget
class RepairStationsWidget extends StatefulWidget {
  @override
  _RepairStationsWidgetState createState() => _RepairStationsWidgetState();
}

class _RepairStationsWidgetState extends State<RepairStationsWidget> {
  @override
  Widget build(BuildContext context) {
    final RepairStationsViewModel viewModel = Provider.of<RepairStationsViewModel>(context);
    return RepairStationsContentWidget(viewModel);
  }
}

class RepairStationsContentWidget extends StatefulWidget {
  RepairStationViewModelInterface viewModel;
  RepairStationsContentWidget(this.viewModel);
  @override
  _RepairStationsContentWidgetState createState() =>
      _RepairStationsContentWidgetState();
}

class _RepairStationsContentWidgetState
    extends State<RepairStationsContentWidget> {

  // Private properties
  TextStyle _sortItemTextStyle = TextStyle(color: AppColors.mainFontColor, fontWeight: FontWeight.w700);

  // Private methods
  Widget _childPopup() => PopupMenuButton<SortType>(
        itemBuilder: (context) => [
          PopupMenuItem(
            value: SortType.price,
            child: Text(RepairStationsStringCatalog.sortByPrice,
                style: _sortItemTextStyle),
          ),
          PopupMenuItem(
              child: Text(RepairStationsStringCatalog.sortByReviews,
                  style: _sortItemTextStyle),
              value: SortType.rating),
          PopupMenuItem(
            child: Text(RepairStationsStringCatalog.sortByDuration,
                style: _sortItemTextStyle),
            value: SortType.time,
          ),
          PopupMenuItem(
            child: Text(RepairStationsStringCatalog.removeSorting,
                style: _sortItemTextStyle),
            value: SortType.initial,
          )
        ],
        onSelected: (value) {
          this.widget.viewModel.sortListBy(value);
        },
        child: Container(
          width: GeneralConstants.genericNavigationButtonWidth,
          child: Icon(Icons.sort),
        ),
      );

  // Initializer

  @override
  void initState() {
    super.initState();
    super.widget.viewModel.viewWasLoaded();
  }

  // Build

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          RepairStationsStringCatalog.repairStationsWidgetTitle,
          style: TextStyle(
            color: AppColors.titleColor,
          ),
        ),
        actions: <Widget>[_childPopup()],
        backgroundColor: AppColors.mainComponentColor,
      ),
      body: Container(
        child: Column(children: <Widget>[
          RepairStationsSearchWidget(this.widget.viewModel),
          Expanded(
            child: RepairStationListViewWidget(this.widget.viewModel),
          ),
        ]),
      ),
    );
  }
}
