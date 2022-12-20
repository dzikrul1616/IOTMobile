import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:uas_app/app/modules/EditProfil/views/edit_profil_view.dart';
import 'package:uas_app/app/modules/home/views/home_view.dart';
import 'package:uas_app/app/modules/profil/views/profil_view.dart';

import '../controllers/lamp_controller.dart';

class LampView extends StatefulWidget {
  const LampView({Key? key}) : super(key: key);

  @override
  State<LampView> createState() => _LampViewState();
}

class _LampViewState extends State<LampView> {
  int brightness = 0;
  bool switchIsOn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(children: [
          const SizedBox(
            height: 40.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => convexbottombar()));
                    },
                    icon: Icon(Icons.arrow_back)),
                const SizedBox(
                  height: 30.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'data',
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      width: 120.0,
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilView()));
                    },
                    icon: Icon(Icons.settings)),
              ],
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30.0,
                ),
                Text(
                  "Lampu",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Office room",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                //  center tengah
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/lampu.png"),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Slider(
                        min: 0,
                        max: 100,
                        value: brightness.toDouble(),
                        onChanged: (double value) {
                          setState(() {
                            brightness = value.toInt();
                          });
                        },
                      ),
                      Text('Brightness: $brightness'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

// class LampView extends GetView<LampController> {
//   const LampView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
    
//   }
// }
