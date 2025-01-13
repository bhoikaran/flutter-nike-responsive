import 'package:flutter/material.dart';


double baseHight = 640.0;
double screenAwareSize(double size, BuildContext context){
  return size * MediaQuery.of(context).size.height / baseHight;
}