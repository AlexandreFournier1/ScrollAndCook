import 'package:flutter/material.dart';
import 'package:scroll_and_cook/styles/colors.dart';
import 'package:scroll_and_cook/styles/padding.dart';
import 'package:scroll_and_cook/styles/radius.dart';
import 'package:scroll_and_cook/styles/spacings.dart';
import 'package:scroll_and_cook/styles/texts.dart';

class CustomPasswordInput extends StatefulWidget {
  const CustomPasswordInput({
    super.key,
    required TextEditingController controller,
    required String label,
    required String hint,
    required FormFieldValidator<String> validator
  }) : _controller = controller, _label = label, _hint = hint, _validator = validator;

  final TextEditingController _controller;
  final FormFieldValidator<String> _validator;
  final String _label;
  final String _hint;

  @override
  State<CustomPasswordInput> createState() => _CustomPasswordInputState();
}

class _CustomPasswordInputState extends State<CustomPasswordInput> {
  bool Obscur = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: kVerticalPaddingFormInput
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          controller: widget._controller,
          validator: widget._validator,
          decoration: InputDecoration(
            labelText: widget._label,
            labelStyle: kTextTextInput,
            hintText: widget._hint,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border: OutlineInputBorder(
                borderRadius: kNormalRadius
            ),
            filled: true,
            fillColor: kWhiteColor,
            suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    Obscur = !Obscur;
                  });
                },
                icon: Icon(
                    Obscur ? Icons.visibility_off : Icons.visibility
                )
            ),
            contentPadding: EdgeInsets.symmetric(vertical: kNormalPadding, horizontal: kNormalPadding),
          ),
          obscureText: Obscur,
        ),
      ),
    );
  }
}