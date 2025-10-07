import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:taxi_app/common/controller/services/profileDateCRUDEServices.dart';
import 'package:taxi_app/common/model/profileDateModel.dart';
import 'package:taxi_app/constant/constent.dart';



class ProfileDataProvider extends ChangeNotifier {
  ProfileDataModel? profileData;

  getProfileData() async {
    profileData =
        await ProfileDataCRUDServices.getProfileDataFromRealTimeDatabase(
            auth.currentUser!.phoneNumber!);
    log(profileData!.toMap().toString());
    notifyListeners();
  }
}