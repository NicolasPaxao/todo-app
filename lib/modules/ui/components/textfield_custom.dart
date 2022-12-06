import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  const TextFieldCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      style: const TextStyle(fontSize: 16),
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:
                BorderSide(width: 1, color: Colors.grey.withOpacity(0.5)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              width: 1,
              color: Colors.purple,
            ),
          ),
          hintText: 'O que devo fazer?',
          hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5))),
    );
  }
}
