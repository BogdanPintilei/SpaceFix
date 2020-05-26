import 'package:SpaceFix/AppCustomization/AppConfigurationCatalog.dart';
import 'package:SpaceFix/AppCustomization/StringCatalog.dart';
import 'package:SpaceFix/SpaceshipComponents/SpaceshipComponentsViewModels/SpaceshipComponentsListViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SpaceshipComponentsListViewWidget extends StatefulWidget {
  @override
  _SpaceshipComponentsListViewWidgetState createState() =>
      _SpaceshipComponentsListViewWidgetState();
}

class _SpaceshipComponentsListViewWidgetState
    extends State<SpaceshipComponentsListViewWidget> {

  final _smallBorderRadius = BorderRadius.circular(GeneralConstants.smallBorderRadius);
  SpaceshipComponentsListViewModelInterface _viewModel;
  final _textFieldController = TextEditingController();

  // Build  UI elements
  
  TextField _buildDataInputTextField() {
    return TextField(
      decoration: InputDecoration(
        hintText: SpaceshipComponentsStringCatalog.textFieldHint,
        errorText:
            _viewModel.isSpaceshipComponentValid() ? null : SpaceshipComponentsStringCatalog.errorText,
      ),
      controller: _textFieldController,
    );
  }

  Widget _buildAddButton() {
    return Container(
        child: Padding(
      padding: EdgeInsets.all(GeneralConstants.mediumEdgeInset),
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: _smallBorderRadius
        ),
        color: AppColors.mainComponentColor,
        child: Text(
          SpaceshipComponentsStringCatalog.addComponent,
          style: TextStyle(color: AppColors.titleColor),
        ),
        onPressed: () {
          _viewModel.addSpaceshipComponentWithName(_textFieldController.text);
        },
      ),
    ));
  }

  Widget buildComponentCard(BuildContext context, int index) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: _smallBorderRadius
        ),
        color: AppColors.mainComponentColor,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              GeneralConstants.mediumEdgeInset,
              GeneralConstants.tinyEdgeInset,
              GeneralConstants.smallEdgeInset,
              GeneralConstants.tinyEdgeInset),
          child: Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                      _viewModel.componentForIndex(index).name,
                      style: TextStyle(
                          color: AppColors.titleColor,
                          fontSize: FontSizes.mediumFontSize,
                          fontWeight: FontWeight.bold)),
                ),
                MaterialButton(
                  height: GeneralConstants.smallButtonSize,
                  minWidth: GeneralConstants.smallButtonSize,
                  splashColor: AppColors.transparent,
                  highlightColor: AppColors.transparent,
                  color: AppColors.transparent,
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.delete,
                        color: AppColors.titleColor,
                      )
                    ],
                  ),
                  onPressed: () => {_viewModel.deleteSpaceshipComponentAtIndex(index)},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildComponentList() {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: _viewModel.numberOfComponents(),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) =>
            buildComponentCard(context, index));
  }

  Widget _buildAddSpaceshipComponentSection() {
    return Row(
      children: <Widget>[
        Flexible(
          child: _buildDataInputTextField(),
        ),
        _buildAddButton()
      ],
    );
  }

  // Dispose

  @override
  void dispose() {
    super.dispose();
    _textFieldController.dispose();
  }
  // Build

  @override
  Widget build(BuildContext context) {
    _viewModel = Provider.of<SpaceshipComponentsListViewModel>(context);
    return Container(
        child: Column(
      children: <Widget>[
        _buildAddSpaceshipComponentSection(),
        _buildComponentList(),
      ],
    ));
  }
}
