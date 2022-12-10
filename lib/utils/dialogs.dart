import 'package:flutter/material.dart';

class DialogsApp {
  static confirmDialog({
    required BuildContext context,
    required String titleModal,
    required String buttonMainAcion,
    required Function() mainFunction,
  }) {
    showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            titleTextStyle: const TextStyle(
                fontSize: 18,
                color: Colors.purple,
                fontWeight: FontWeight.bold),
            title: Text(titleModal),
            actions: [
              TextButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.withOpacity(0.5)),
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancelar',
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
              TextButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple.withOpacity(0.5)),
                onPressed: mainFunction,
                child: Text(buttonMainAcion,
                    style: const TextStyle(fontSize: 16, color: Colors.white)),
              )
            ],
          );
        }));
  }
}
