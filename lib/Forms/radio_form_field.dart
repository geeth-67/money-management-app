import 'package:flutter/material.dart';

class RadioFormField extends FormField<String> {
  RadioFormField({
    required String title,
    required List<String> options,
    required Function(String?) onChanged,
    FormFieldSetter<String>? onSaved,
    FormFieldValidator<String>? validator,
  }) : super(
    onSaved: onSaved,
    validator: validator,
    builder: (FormFieldState<String> state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          Row(
            children: options.map((e) {
              return Expanded(child: RadioListTile(
                title: Text(e),
                value: e,
                groupValue: state.value,
                onChanged: (value) {
                  state.didChange(value);
                },
              )
              );
            }).toList(),
          ),
          if (state.hasError)
            Text(
              state.errorText!,
              style: TextStyle(color: Colors.red),
            ),
        ],
      );
    },
  );
}