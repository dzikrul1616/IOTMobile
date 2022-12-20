import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:uas_app/app/modules/EditDevice/views/edit_device_view.dart';
import 'package:uas_app/app/modules/Lamp/views/lamp_view.dart';
import 'package:uas_app/app/modules/profil/views/profil_view.dart';

import '../controllers/home_add_controller.dart';

class HomeAddView extends StatefulWidget {
  const HomeAddView({Key? key}) : super(key: key);

  @override
  State<HomeAddView> createState() => _HomeAddViewState();
}

class _HomeAddViewState extends State<HomeAddView> {
  // controll tombol on off
  bool switch1IsOn = false;
  bool switch2IsOn = false;
  bool switch3IsOn = false;
  bool switch4IsOn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(children: [
          const SizedBox(
            height: 40.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Home",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.italic,
                  ),
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
                    IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                  ],
                ),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditDeviceView()));
                    },
                    icon: Icon(Icons.settings)),
              ],
            ),
          ),
          //spasi
          const SizedBox(
            height: 30.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 150.0,
                      height: 200,
                      padding: EdgeInsets.all(10.0),
                      margin: EdgeInsets.only(right: 10.0),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 117, 198),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            color: Colors.black.withOpacity(.1),
                          )
                        ],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(16.0),
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LampView()));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10.0,
                            ),
                            Icon(
                              Icons.tv,
                              color: Colors.white,
                              size: 25,
                            ),
                            const SizedBox(
                              height: 70.0,
                            ),
                            Text(
                              "Living room",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w300,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            // tombol on off
                            Switch(
                              value: switch1IsOn,
                              onChanged: (value) {
                                setState(() {
                                  switch1IsOn = value;
                                });
                              },
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 255, 117, 198)),
                      ),
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    Container(
                      width: 150.0,
                      height: 200,
                      padding: EdgeInsets.all(10.0),
                      margin: EdgeInsets.only(right: 10.0),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 117, 209, 255),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            color: Colors.black.withOpacity(.1),
                          )
                        ],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(16.0),
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LampView()));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10.0,
                            ),
                            Icon(
                              Icons.laptop,
                              color: Colors.white,
                              size: 25,
                            ),
                            const SizedBox(
                              height: 70.0,
                            ),
                            Text(
                              "Office room",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w300,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            Switch(
                              value: switch2IsOn,
                              onChanged: (value) {
                                setState(() {
                                  switch2IsOn = value;
                                });
                              },
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 117, 209, 255)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Row(
                  children: [
                    Container(
                      width: 150.0,
                      height: 200,
                      padding: EdgeInsets.all(10.0),
                      margin: EdgeInsets.only(right: 10.0),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(189, 93, 245, 171),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            color: Colors.black.withOpacity(.1),
                          )
                        ],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(16.0),
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LampView()));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10.0,
                            ),
                            Icon(
                              Icons.tv,
                              color: Colors.white,
                              size: 25,
                            ),
                            const SizedBox(
                              height: 70.0,
                            ),
                            Text(
                              "Living room",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w300,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            Switch(
                              value: switch3IsOn,
                              onChanged: (value) {
                                setState(() {
                                  switch3IsOn = value;
                                });
                              },
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(189, 93, 245, 171)),
                      ),
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    Container(
                      width: 150.0,
                      height: 200,
                      padding: EdgeInsets.all(10.0),
                      margin: EdgeInsets.only(right: 10.0),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 250, 117),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            color: Colors.black.withOpacity(.1),
                          )
                        ],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(16.0),
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LampView()));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10.0,
                            ),
                            Icon(
                              Icons.laptop,
                              color: Colors.white,
                              size: 25,
                            ),
                            const SizedBox(
                              height: 70.0,
                            ),
                            Text(
                              "Office room",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w300,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            Switch(
                              value: switch4IsOn,
                              onChanged: (value) {
                                setState(() {
                                  switch4IsOn = value;
                                });
                              },
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 255, 250, 117)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

// class HomeAddView extends GetView<HomeAddController> {
//   const HomeAddView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {

//   }
// }
