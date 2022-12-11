import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../app_dependency.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: ((context) {
      return ElevatedButton(
        onPressed: () async {
          FocusScope.of(context).unfocus();
          if (todoStates.formKey.currentState!.validate()) {
            await todoStates.postTodo(context);
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: todoStates.loading!
              ? Colors.purple.withOpacity(0.5)
              : Colors.purple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.zero,
        ),
        child: todoStates.loading!
            ? const SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : const Icon(
                Icons.keyboard_arrow_right_outlined,
                size: 32,
                color: Colors.white,
              ),
      );
    }));
  }
}
