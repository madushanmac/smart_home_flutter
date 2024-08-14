import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/device_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double horizontalPadding = 45.0;

  final double verticalPadding = 30.0;

  // list of smart devices
  List mySmartDevices = [
    // [ smartDeviceName, iconPath , powerStatus ]
    ["Smart Light", "lib/icons/light-bulb.png", true],
    ["Smart AC", "lib/icons/air-conditioner.png", false],
    ["Smart TV", "lib/icons/smart-tv.png", false],
    ["Smart Fan", "lib/icons/fan.png", false],
  ];

  // power button switched
  void powerSwitchChanged(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // app bar
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding, vertical: verticalPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // menu icon
                Image.asset(
                  'lib/icons/menu.png',
                  height: 35.0,
                ),

                // account icon avatar
                const CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Text('C'),
                )
              ],
            ),
          ),

          // welcome home
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Home ',
                  style: TextStyle(fontSize: 20, color: Colors.grey.shade800),
                ),
                Text(
                  'CHAMINDU',
                  style: GoogleFonts.bebasNeue(fontSize: 72),
                )
              ],
            ),
          ),

          const Divider(
            thickness: 1,
            color: Color.fromARGB(255, 204, 204, 204),
          ),

          // Smart Devices title
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Text(
              "Smart Devices",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                  color: Colors.grey.shade800),
            ),
          ),

          // grid view menu
          Expanded(
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SmartDeviceBox(
                      smartDeviceName: mySmartDevices[index][0],
                      iconPath: mySmartDevices[index][1],
                      powerOn: mySmartDevices[index][2],
                      onChanged: (value) => powerSwitchChanged(value, index),
                    ));
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1 / 1.2),
            ),
          )
        ],
      )),
    );
  }
}
