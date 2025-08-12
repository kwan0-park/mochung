import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'dart:ui' as ui;

class Guide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500.0,
      margin: const EdgeInsetsDirectional.all(20.0),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '식사 안내',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, height: 3),
          ),
          Text(
            '식사는 XX분 전부터 가능합니다.',
            style: TextStyle(height: 2,)
          ),
          Text(
            '식사는 코스요리이며, 맥주는 무제한으로 제공됩니다.\n'
            '2층에서 식과 함께 먼저 식사할 수 있고,\n'
            '3층에서 예식 이후 식사할 수 있습니다.',
            style: TextStyle(height: 2,),
            textAlign: TextAlign.center,
          ),

          Text(
            '예식 안내',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, height: 3),
          ),
          Text(
            '예식 많이 즐겨주세요!\n'
            '사진 많이 찍어주세요!\n'
            '박수 많이 쳐주세요!\n'
            '호응 많이 해주세요!\n',
            style: TextStyle(height: 2,),
            textAlign: TextAlign.center,
          ),
        ],
      )
    );
  }
}

