import 'dart:convert';
import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:taxi_app/constant/constent.dart';
import 'package:taxi_app/rider/view/bookARiderScreen/bookARideScreen.dart';
import 'package:taxi_app/rider/view/homeScreen/riderHomeScreen.dart';


class RiderHomeScreeBuilder extends StatefulWidget {
  const RiderHomeScreeBuilder({super.key});

  @override
  State<RiderHomeScreeBuilder> createState() => _RiderHomeScreeBuilderState();
}

class _RiderHomeScreeBuilderState extends State<RiderHomeScreeBuilder> {
  DatabaseReference riderRideRequestRef = FirebaseDatabase.instance
      .ref()
      .child('RideRequest/${auth.currentUser!.phoneNumber}');
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: riderRideRequestRef.onValue,
        builder: (context, event) {
          if (event.connectionState == ConnectionState.waiting) {
            return const RiderHomeScreen();
          }
          if (event.data!.snapshot.value != null) {
            log('The Data is');
            log(event.data!.snapshot.value.toString());
            return const BookARideScreen();
          } else {
            return const RiderHomeScreen();
          }
        });
  }
}