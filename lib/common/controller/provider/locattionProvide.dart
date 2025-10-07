import 'package:flutter/material.dart';
import 'package:taxi_app/common/model/pickupNDropLocationModel.dart';
import 'package:taxi_app/common/model/searchedAddressModel.dart';


class LocationProvider extends ChangeNotifier {
  List<SearchedAddressModel> searchedAddress = [];
  PickupNDropLocationModel? dropLocation;
  PickupNDropLocationModel? pickupLocation;

  nullifyDropLocation() {
    dropLocation = null;
    notifyListeners();
  }

  nullifyPickupLocation() {
    pickupLocation = null;
    notifyListeners();
  }

  updateSearchedAddress(List<SearchedAddressModel> newAddressList) {
    searchedAddress = newAddressList;
    notifyListeners();
  }

  emptySearchedAddressList() {
    searchedAddress = [];
    notifyListeners();
  }

  updateDropLocation(PickupNDropLocationModel newAddress) {
    dropLocation = newAddress;
    notifyListeners();
  }

  updatePickupLocation(PickupNDropLocationModel newAddress) {
    pickupLocation = newAddress;
    notifyListeners();
  }
}