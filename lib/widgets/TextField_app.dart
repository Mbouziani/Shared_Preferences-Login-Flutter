import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  MyTextField(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.ValdatorText,
      this.keyboardType = TextInputType.text,
      required this.onChange})
      : super(key: key);
  String hintText;
  String ValdatorText;
  TextEditingController controller;
  TextInputType keyboardType;
  VoidCallback onChange;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty || value == null) {
          return ValdatorText;
        }
        return null;
      },
      keyboardType: keyboardType,
      controller: controller,
      onChanged: (value) {
        onChange();
      },
      decoration: InputDecoration(
        filled: true,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 13.0, horizontal: 24),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.black54,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(1),
        ),
      ),
    );
  }
}
