import 'package:flutter/material.dart';

class MemoStateful extends StatefulWidget {
  @override
  _MemoStatefulState createState() => _MemoStatefulState();
}

class _MemoStatefulState extends State<MemoStateful> {
  bool isOn = false;
  double circleSliderValue = 0;

  void _toggle() {
    setState(() {
      isOn = !isOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Contoh Tombol On/Off'),
        ),
        body: Center(
          child: Column(
            children: [
              Switch(
                value: isOn,
                onChanged: (bool value) {
                  setState(() {
                    isOn = value;
                  });
                },
              ),
              CircleAvatar(
                radius: 50,
              ),

// Membuat progress bar yang akan ditampilkan di lingkaran
              LinearProgressIndicator(
                value: circleSliderValue / 100,
              ),

// Memutar progress bar sehingga hanya menampilkan setengah lingkaran
              Transform.rotate(
                angle: 1,
                child: LinearProgressIndicator(
                  value: circleSliderValue / 100,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
