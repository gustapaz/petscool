import 'package:flutter/material.dart';

class TextFormFieldStyle extends StatefulWidget {
  final bool? enabled;
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? Function(String? value)? validator;
  final void Function()? onEditingComplete;

  const TextFormFieldStyle({
    Key? key,
    this.enabled = true,
    this.labelText,
    this.hintText,
    this.controller,
    this.onChanged,
    this.validator,
    this.onEditingComplete,
  }) : super(key: key);

  @override
  State<TextFormFieldStyle> createState() => _TextFormFieldStyleState();
}

class _TextFormFieldStyleState extends State<TextFormFieldStyle> {
  bool password = false;

  @override
  Widget build(BuildContext context) {
    if (widget.labelText == 'Senha') {
      password = true;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText!,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          enabled: widget.enabled,
          controller: widget.controller,
          obscureText: password,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xFF848599),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(
                color: Color(0xFFB4B5CC),
                width: 1,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                color: const Color(0xFFB4B5CC).withOpacity(.5),
                width: 1,
              ),
            ),
          ),
          onChanged: widget.onChanged,
          validator: widget.validator,
          onEditingComplete: widget.onEditingComplete,
        ),
      ],
    );
  }
}
