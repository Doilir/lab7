import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const CornerRadiusScreen(),
    );
  }
}

class CornerRadiusScreen extends StatefulWidget {
  const CornerRadiusScreen({super.key});

  @override
  State<CornerRadiusScreen> createState() => _CornerRadiusScreenState();
}

class _CornerRadiusScreenState extends State<CornerRadiusScreen> {
  double _tl = 0, _tr = 0, _bl = 0, _br = 0;

  Widget _slider(String label, double val, ValueChanged<double> onChanged) {
    return Column(
      children: [
        Text('$label: ${val.toStringAsFixed(2)}'),
        Slider(value: val, min: 0, max: 75, onChanged: onChanged),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Demo Home Page'), centerTitle: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(_tl),
                topRight: Radius.circular(_tr),
                bottomLeft: Radius.circular(_bl),
                bottomRight: Radius.circular(_br),
              ),
            ),
          ),
          const SizedBox(height: 36),
          Row(
            children: [
              Expanded(child: _slider('TL', _tl, (v) => setState(() => _tl = v))),
              Expanded(child: _slider('TR', _tr, (v) => setState(() => _tr = v))),
            ],
          ),
          Row(
            children: [
              Expanded(child: _slider('BL', _bl, (v) => setState(() => _bl = v))),
              Expanded(child: _slider('BR', _br, (v) => setState(() => _br = v))),
            ],
          ),
        ],
      ),
    );
  }
}