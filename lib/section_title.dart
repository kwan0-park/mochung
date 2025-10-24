import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:wedding_invitation/common/global_variable.dart';

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
              color: lightPrimaryColor, 
            ),
          ),
        ),
        const SizedBox(height: 20),
        AutoSizeText(
          '“$text”',
          textAlign: textAlign,
          style: const TextStyle(
            color: primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            fontFamily: 'Pretendard'
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}