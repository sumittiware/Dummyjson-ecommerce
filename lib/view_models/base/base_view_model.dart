import 'package:ecom_app/utils/enum.dart';
import 'package:flutter/material.dart';

class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.idle;
  bool _fullDataLoaded = false;

  ViewState get state => _state;
  bool get isBusy => _state == ViewState.busy;
  bool get isInitalizing => _state == ViewState.initalizing;

  bool get fullDataLoaded => _fullDataLoaded;

  void setFullDataLoaded(bool value) {
    _fullDataLoaded = value;
    notifyListeners();
  }

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}
