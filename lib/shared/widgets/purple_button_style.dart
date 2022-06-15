import 'package:flutter/material.dart';

class PurpleButtonStyle extends StatefulWidget {
  final String? label;
  final void Function()? onTap;

  const PurpleButtonStyle({
    Key? key,
    this.label,
    this.onTap,
  }) : super(key: key);

  @override
  State<PurpleButtonStyle> createState() => _PurpleButtonStyleState();
}

class _PurpleButtonStyleState extends State<PurpleButtonStyle> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap!,
      child: Container(
        height: 48,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: const Color(0xFF642CA9),
        ),
        child: Text(
          widget.label!,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
