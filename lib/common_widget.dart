import 'package:flutter/material.dart';

Widget commonTextField(
  TextEditingController tfController,
  String hintText,
) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
    child: TextFormField(
      // validator: validFn,
      controller: tfController,
      decoration: InputDecoration(
          border: const OutlineInputBorder(), hintText: hintText),
    ),
  );
}
