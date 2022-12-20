import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:uas_app/app/modules/EditProfil/views/edit_profil_view.dart';
import 'package:uas_app/app/modules/home/views/home_view.dart';
import 'package:uas_app/app/modules/profil/views/profil_view.dart';

import '../controllers/edit_device_controller.dart';

class EditDeviceView extends GetView<EditDeviceController> {
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
                  //klik
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
                  "Google wifi",
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
                  "Device Connection",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Container(
                  color: Color.fromARGB(255, 232, 232, 232),
                  width: 400,
                  height: 95,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Pixel 5",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                const SizedBox(
                                  height: 3.0,
                                ),
                                Text(
                                  "Connected",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              EditProfilView()));
                                },
                                icon: Icon(Icons.settings)),
                            const SizedBox(
                              height: 10.0,
                            ),
                          ],
                        )
                      ],
                    ),
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
