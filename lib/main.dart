import 'package:beacon_demo/requirement_state_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RequirementStateController());
    final themeData = Theme.of(context);
    const primary = Colors.blue;

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: primary,
        appBarTheme: themeData.appBarTheme.copyWith(
          elevation: 0.5,
          color: Colors.white,
          actionsIconTheme: themeData.primaryIconTheme.copyWith(
            color: primary,
          ),
          iconTheme: themeData.primaryIconTheme.copyWith(
            color: primary,
          ),
          textTheme: themeData.primaryTextTheme.copyWith(
            headline6: themeData.textTheme.headline6?.copyWith(
              color: primary,
            ),
          ), systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: primary,
      ),
      home: HomePage(),
    );
  }
}
//
// import 'dart:async';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_beacon/flutter_beacon.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   StreamSubscription<RangingResult>? _streamRanging;
//   final _regionBeacons = <Region, List<Beacon>>{};
//   final _beacons = <Beacon>[];
//   @override
//   void initState() {
//     super.initState();
//
//     // Request location permission
//     requestPermission();
//   }
//
//   void requestPermission() async {
//     if (await Permission.location.request().isGranted) {
//       // Location permission granted
//       initBeacon();
//     } else {
//       // Location permission denied
//       showDialog(
//         context: context,
//         builder: (_) => AlertDialog(
//           title: Text('Location Permission Required'),
//           content: Text(
//               'Please grant location permission to enable beacon scanning.'),
//           actions: [
//             TextButton(
//               child: Text('OK'),
//               onPressed: () {
//                 Navigator.pop(context);
//                 // Open app settings to allow the user to grant permission manually
//                 openAppSettings();
//               },
//             ),
//           ],
//         ),
//       );
//     }
//   }
//
//   // FlutterBeacon.initialize();
//   initBeacon() async {
//     try {
//       await flutterBeacon.initializeScanning;
//       print('Beacon scanner initialized');
//     } on PlatformException catch (e) {
//       print(e);
//     }
//     // Configure the regions to scan for iBeacons
//     final regions = <Region>[];
//     if (Platform.isIOS) {
//       regions.add(Region(
//           identifier: 'MyBeacon',
//           proximityUUID: 'a86be991-76c7-4fc4-892a-551acf07c77c',
//           major: null,
//           minor: null));
//     } else {
//       regions.add(Region(identifier: 'com.beacon'));
//     }
//     flutterBeacon.monitoring(regions).listen((MonitoringResult result) {
//       // result contains a region, event type and event state
//     });
//     // Start ranging for beacons
//     _streamRanging =
//         flutterBeacon.ranging(regions).listen((RangingResult result) {
//           if (result != null && result.beacons.isNotEmpty) {
//             // Get a list of beacons in range
//             List<Beacon> beacons = result.beacons;
//
//             // Iterate through beacons and get their data
//             for (var beacon in beacons) {
//               String uuid = beacon.proximityUUID;
//               int major = beacon.major;
//               int minor = beacon.minor;
//               int rssi = beacon.rssi;
//               // Do something with beacon data
//               print(
//                   'Beacon detected: UUID=$uuid, major=$major, minor=$minor, rssi=$rssi');
//             }
//           }
//         });
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     // Stop ranging for beacons
//     _streamRanging?.cancel();
//     flutterBeacon.close;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'iBeacon Detection',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('iBeacon Detection'),
//         ),
//         body: Center(
//           child: Text('Searching for iBeacons...'),
//         ),
//       ),
//     );
//   }
// }