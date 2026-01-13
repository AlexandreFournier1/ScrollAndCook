import 'package:flutter/material.dart';
import 'package:scroll_and_cook/styles/colors.dart';
import 'package:scroll_and_cook/styles/radius.dart';
import 'package:scroll_and_cook/styles/spacings.dart';
import 'package:scroll_and_cook/styles/texts.dart';

class CustomCombobox extends StatelessWidget {
  const CustomCombobox({
    super.key,
    required TextEditingController controller,
    required FormFieldValidator<String> validator,
    required String label,
    required String hint,
    required List<String> comboItems
  })
      : _controller = controller,
        _validator = validator,
        _label = label,
        _hint = hint,
        _comboItems = comboItems;

  final TextEditingController _controller;
  final FormFieldValidator<String> _validator;
  final String _label;
  final String _hint;

  final List<String> _comboItems;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: kVerticalPaddingFormInput,
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: DropdownButtonFormField<String>(
          validator: _validator,
          decoration: InputDecoration(
            labelText: _label,
            labelStyle: kTextTextInput,
            hintText: _hint,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border: OutlineInputBorder(
              borderRadius: kNormalRadius,
            ),
            filled: true,
            fillColor: kWhiteColor,
            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          ),
          items: _comboItems.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (newValue) {
            _controller.text = newValue!;
          },
        ),
      ),
    );
  }
}