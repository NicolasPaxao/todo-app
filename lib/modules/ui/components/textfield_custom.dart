import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../app_dependency.dart';

class TextFieldCustom extends StatelessWidget {
  const TextFieldCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: ((context) {
      
      return Form(
        key: todoStates.formKey,
        child: TextFormField(
          cursorColor: Colors.black,
          style: const TextStyle(fontSize: 16),
          controller: todoStates.todoController,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
            filled: true,
            fillColor: Colors.white,
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  BorderSide(width: 1, color: Colors.red.withOpacity(0.5)),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  BorderSide(width: 1, color: Colors.red.withOpacity(0.5)),
            ),
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
            hintStyle: TextStyle(
              color: Colors.grey.withOpacity(0.5),
            ),
          ),
          onChanged: (value) {
            todoStates.setTodoTitle(value);
          },
          validator: ((value) {
            if (value!.trim().isEmpty) {
              return 'Campo obrigatório';
            }
            return null;
          }),
        ),
      );
    }));
  }
}
