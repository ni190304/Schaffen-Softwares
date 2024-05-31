// ignore: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpandableText extends StatefulWidget {
  final String text;

  const ExpandableText({required this.text, super.key});

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

TextStyle lorem() {
  return GoogleFonts.montserrat(
    textStyle: const TextStyle(
      color: Color.fromARGB(255, 34, 33, 33),
      fontSize: 16.5,
      fontWeight: FontWeight.w600,
    ),
  );
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: Text.rich(
        TextSpan(
          text: _isExpanded
              ? widget.text
              : 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod vestibulum lacus, nec consequat nulla efficitur sit amet. Proin eu lorem libero. Sed id enim in urna tincidunt sodales. Vivamus vel semper ame...',
          style: lorem().copyWith(fontWeight: FontWeight.w100, fontSize: 14),
          children: _isExpanded
              ? [
                  TextSpan(
                    text:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod vestibulum lacus, nec consequat nulla efficitur sit amet. Proin eu lorem libero. Sed id enim in urna tincidunt sodales. Vivamus vel semper ame...',
                    style: lorem()
                        .copyWith(fontWeight: FontWeight.w100, fontSize: 14),
                  ),
                ]
              : [
                  TextSpan(
                    text: ' Read more',
                    style: lorem().copyWith(
                        color: Colors.red,
                        fontWeight: FontWeight.w100,
                        fontSize: 14),
                  ),
                ],
        ),
      ),
    );
  }
}
