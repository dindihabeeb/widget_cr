import 'package:flutter/material.dart';
import 'package:widget_cr/screens/clip.dart';

void main() => runApp(const ClipDemoApp());

class ClipDemoApp extends StatelessWidget {
  const ClipDemoApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clipping Demo',
      debugShowCheckedModeBanner: false,
      home: ClipPage()
    );
  }
}
