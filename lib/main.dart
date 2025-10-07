import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:taxi_app/common/controller/provider/authProvider.dart';
import 'package:taxi_app/common/controller/provider/locattionProvide.dart';
import 'package:taxi_app/common/controller/provider/profileDateProvider.dart';
import 'package:taxi_app/common/view/signInLogic/signInLogic.dart';
import 'package:taxi_app/constant/utils/colors.dart';
import 'package:taxi_app/driver/controller/provider/riderRequestProvider.dart';
import 'package:taxi_app/driver/controller/services/bottomNavBarProvider.dart';
import 'package:taxi_app/driver/controller/services/mapsProviderDriver.dart';
import 'package:taxi_app/firebase_options.dart';
import 'package:taxi_app/rider/controller/provider/bottomNavBarRiderProvider/bottomNavBarRiderProvider.dart';
import 'package:taxi_app/rider/controller/provider/tripProvider/rideRequestProvider.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const Uber());
}

class Uber extends StatefulWidget {
  const Uber({super.key});

  @override
  State<Uber> createState() => _UberState();
}

class _UberState extends State<Uber> {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, _, __) {
      return MultiProvider(
        providers: [
          // ! Common Providers
          ChangeNotifierProvider<MobileAuthProvider>(
            create: (_) => MobileAuthProvider(),
          ),
          ChangeNotifierProvider<LocationProvider>(
            create: (_) => LocationProvider(),
          ),
          ChangeNotifierProvider<ProfileDataProvider>(
            create: (_) => ProfileDataProvider(),
          ),
          // ! Rider Providers
          ChangeNotifierProvider<BottomNavBarRiderProvider>(
            create: (_) => BottomNavBarRiderProvider(),
          ),
          ChangeNotifierProvider<RideRequestProvider>(
            create: (_) => RideRequestProvider(),
          ),
          // ! Driver Providers
          ChangeNotifierProvider<BottomNavBarDriverProvider>(
            create: (_) => BottomNavBarDriverProvider(),
          ),
          ChangeNotifierProvider<MapsProviderDriver>(
            create: (_) => MapsProviderDriver(),
          ),
          ChangeNotifierProvider<RideRequestProviderDriver>(
            create: (_) => RideRequestProviderDriver(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              color: white,
              elevation: 0,
            ),
          ),
          home: const SignInLogic(),
        ),
      );
      // return
    });
  }
}