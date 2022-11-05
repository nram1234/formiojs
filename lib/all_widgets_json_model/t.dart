
import 'package:flutter/material.dart';

class Tes extends StatefulWidget {
bool v;
Function(bool?) f;

Tes({required this.v,required this.f});

  @override
  State<Tes> createState() => _TesState();
}

class _TesState extends State<Tes> {
  @override
  Widget build(BuildContext context) {

    return Checkbox(value: widget.v, onChanged: widget.f);
  }
}
