import 'package:flutter/material.dart';
Widget customTextFormField({required String label,required String svgUrl}){
  return  TextFormField(
    decoration: InputDecoration(
        prefixIcon: Icon(Icons.person), labelText: label),
  );
}