import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class SectionTitle extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final double spacingTop;

  const SectionTitle({
    Key? key,
    required this.text,
    this.textAlign = TextAlign.center,
    this.spacingTop = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (spacingTop > 0) SizedBox(height: spacingTop),
        const Center(
          child: SizedBox(
            width: 250,
            child: const Divider(
              thickness: 1,
              color: Color.fromRGBO(41, 82, 56, 0.3), // 연한 녹색 계열
              // indent: 60, // 양쪽 여백
              // endIndent: 60,
            ),
          ),
        ),
        const SizedBox(height: 20),
        AutoSizeText(
          text,
          textAlign: textAlign,
          style: const TextStyle(
            color: Color.fromRGBO(41, 82, 56, 1),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}