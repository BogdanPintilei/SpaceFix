import 'package:flutter/material.dart';
import 'package:SpaceFix/AppCatalogs/StringCatalog.dart';
import 'package:SpaceFix/AppCatalogs/AppConfigurationCatalog.dart';
import 'package:SpaceFix/Models/RepairStation.dart';
import 'package:SpaceFix/RepairStations/RepairStationsViewModel/RepairStationsViewModelInterface.dart';

class RepairStationListViewWidget extends StatefulWidget {
  final RepairStationViewModelInterface viewModel;
  RepairStationListViewWidget(this.viewModel);
  @override
  _RepairStationListViewWidgetState createState() =>
      _RepairStationListViewWidgetState();
}

class _RepairStationListViewWidgetState
    extends State<RepairStationListViewWidget> {
  // Private Methods

  Widget _buildStationsListCard(BuildContext context, int index) {
    RepairStation station = this.widget.viewModel.repairStationForIndex(index);
    // Private properties
    EdgeInsets _contentPadding =
        EdgeInsets.all(GeneralConstants.mediumEdgeInset);
    BorderRadius _smallBorderRadius =
        BorderRadius.circular(GeneralConstants.smallBorderRadius);
    TextStyle _cardDataTextStyle = TextStyle(
      fontSize: FontSizes.mediumFontSize,
      fontWeight: FontWeight.bold,
    );

    Widget _buildCardDetailsSection(String headerText, String scoreText) {
      return Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: GeneralConstants.smallEdgeInset),
            child: Text(
              headerText,
              style: _cardDataTextStyle,
            ),
          ),
          Text(
            scoreText,
            style: _cardDataTextStyle,
          ),
        ],
      );
    }

    Widget _buildCardContent() {
      return Padding(
        padding: EdgeInsets.only(top: GeneralConstants.cardCellEdgeInset),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: _smallBorderRadius,
              color: AppColors.mainBackgroundColorTransparent),
          child: Column(
            children: <Widget>[
              Padding(
                padding: _contentPadding,
                child: Row(children: <Widget>[
                  Text(
                    station.name,
                    style: TextStyle(
                      fontSize: FontSizes.hugeFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]),
              ),
              Padding(
                padding: _contentPadding,
                child: Row(children: <Widget>[
                  _buildCardDetailsSection(
                      RepairStationsStringCatalog.priceScore,
                      station.priceScore()),
                  Spacer(),
                  _buildCardDetailsSection(
                      RepairStationsStringCatalog.ratingScore,
                      station.rating.toString()),
                  Spacer(),
                  _buildCardDetailsSection(
                      RepairStationsStringCatalog.averageDurationScore,
                      station.duration())
                ]),
              )
            ],
          ),
        ),
      );
    }

    return Container(
      color: AppColors.mainBackgroundColor,
      child: Padding(
        padding: EdgeInsets.all(GeneralConstants.smallEdgeInset),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: _smallBorderRadius),
          color: AppColors.cellBackgroundColor,
          child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(station.stationImageURL),
                      fit: BoxFit.cover),
                  borderRadius: _smallBorderRadius),
              child: _buildCardContent()),
        ),
      ),
    );
  }

  // Build

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
            itemCount: this.widget.viewModel.numberOfRepairStations(),
            itemBuilder: (BuildContext context, int index) =>
                _buildStationsListCard(context, index)));
  }
}
