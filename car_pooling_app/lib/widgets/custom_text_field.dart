import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required TextEditingController textController,
    required this.hintText,
    this.keyboardTextType,
    this.initialText,
    this.size,
  })  : _textController = textController,
        super(key: key);

  final TextEditingController _textController;
  final String hintText;
  final TextInputType? keyboardTextType;
  final String? initialText;
  final int? size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8, right: 8, top: 5, bottom: 5),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
      child: TextField(
        inputFormatters: [
          if (size != null) 
            LengthLimitingTextInputFormatter(size),
            
          if (keyboardTextType == TextInputType.number)
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        ],
        controller: _textController,
        keyboardType: keyboardTextType ?? TextInputType.text,
        decoration: InputDecoration.collapsed(
          hintText: hintText,
        ),
      ),
    );
  }
}
