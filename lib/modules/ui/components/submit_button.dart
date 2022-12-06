
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.zero,
      ),
      child: const Icon(
        Icons.keyboard_arrow_right_outlined,
        size: 32,
        color: Colors.white,
      ),
    );
  }
}
