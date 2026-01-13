import 'package:flutter/material.dart';
import 'package:scroll_and_cook/styles/colors.dart';
import 'package:scroll_and_cook/styles/padding.dart';
import 'package:scroll_and_cook/styles/radius.dart';
import 'package:scroll_and_cook/styles/spacings.dart';
import 'package:scroll_and_cook/styles/texts.dart';

class CustomTextInput extends StatelessWidget {
  const CustomTextInput({
    super.key,
    required TextEditingController controller,
    required FormFieldValidator<String> validator,
    required String label,
    required String hint,
    required bool isEmail,
  }) : _controller = controller, _validator = validator, _label = label, _hint = hint, _isEmail = isEmail;

  final TextEditingController _controller;
  final FormFieldValidator<String> _validator;
  final String _label;
  final String _hint;
  final bool _isEmail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: kVerticalPaddingFormInput
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          controller: _controller,
          validator: _validator,
          keyboardType: _isEmail ? TextInputType.emailAddress : TextInputType.text,
          decoration: InputDecoration(
            labelText: _label,
            labelStyle: kTextTextInput,
            hintText: _hint,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border: OutlineInputBorder(
                borderRadius: kNormalRadius
            ),
            filled: true,
            fillColor: kWhiteColor,
            contentPadding: EdgeInsets.symmetric(vertical: kNormalPadding, horizontal: kNormalPadding)
          ),
        ),
      ),
    );
  }
}
