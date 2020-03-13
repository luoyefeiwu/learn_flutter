import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Slider组件",
      home: SliderView(),
    );
  }
}

class SliderView extends StatefulWidget {
  @override
  _SliderViewState createState() => _SliderViewState();
}

class _SliderViewState extends State<SliderView> {
  double sliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slider组件"),
      ),
      body: Slider(
          onChanged: (v) {
            setState(() {
              sliderValue = v;
            });
          },
          value: sliderValue),
    );
  }
}
