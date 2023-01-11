import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required TextEditingController textController,
    required this.hintText,
    this.keyboardTextType,
    this.initialText,
  })  : _textController = textController,
        super(key: key);

  final TextEditingController _textController;
  final String hintText;
  final TextInputType? keyboardTextType;
  final String? initialText;

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      margin: const EdgeInsets.only(left: 8, right: 8, top: 5, bottom: 5),
      curve: Neumorphic.DEFAULT_CURVE,
      style: NeumorphicStyle(depth: NeumorphicTheme.embossDepth(context)),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
      child: TextField(
        controller: _textController,
        keyboardType: keyboardTextType ?? TextInputType.text,
        decoration: InputDecoration.collapsed(
          hintText: hintText,
        ),
      ),
    );
  }
}
