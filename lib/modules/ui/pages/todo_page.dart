import 'package:flutter/material.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffDA4413),
        toolbarHeight: kToolbarHeight + 20,
        title: const Text(
          'TODO\'s',
          style: TextStyle(
              fontSize: 28,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
    );
  }
}
