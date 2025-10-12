import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/services.dart';
import 'dart:html' as html;
import 'dart:ui' as ui;
import 'package:mochung/common/app_radii.dart';

final Color indiBlueColor = Color.fromRGBO(102, 142, 170, 1.0);
final Color indiPinkColor = Color.fromRGBO(206, 131, 131, 1.0);

class BankAccount extends StatelessWidget {
  void _copyToClipboard(String text, BuildContext context) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('계좌번호가 복사되었습니다.'),
      ),
    );
  }

  Widget _buildExpansionItem(BuildContext context, String bank, String account, String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0), // 좌우 15px 여백
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: AutoSizeText(
              '$bank $account ($name)',
              style: const TextStyle(fontSize: 14.0),
              minFontSize: 10,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Clipboard.setData(ClipboardData(text: account));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("계좌번호가 복사되었습니다.")),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
            child: const Text("복사"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            ExpansionTile(
              title: Center(
                child: Text(
                  '       신랑측 계좌번호',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: indiBlueColor),
                ),
              ),
              initiallyExpanded: false,
              backgroundColor: Colors.white,
              collapsedBackgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(bigRadius),
                side: const BorderSide(width: 0.25, color: Color.fromRGBO(41, 82, 56, 1.0)),
              ),
              collapsedShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(bigRadius),
                side: const BorderSide(width: 0.25, color: Color.fromRGBO(41, 82, 56, 1.0)),
              ),
              children: <Widget>[
                _buildExpansionItem(context, '국민', '057-24-0338-924', '박봉희'),
                const SizedBox(height: 10),
                _buildExpansionItem(context, '국민', '353-21-0165-491', '김순례'),
                const SizedBox(height: 10),
                _buildExpansionItem(context, '새마을금고', '9003-242628-139', '박관영'),
                const SizedBox(height: 10),
              ]
            ),
            const SizedBox(height: 10),
            ExpansionTile(
              title: Center(
                child: Text(
                  '       신부측 계좌번호',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: indiPinkColor),
                ),
              ),
              initiallyExpanded: false,
              backgroundColor: Colors.white,
              collapsedBackgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(bigRadius),
                side: const BorderSide(width: 0.25, color: Color.fromRGBO(41, 82, 56, 1.0)),
              ),
              collapsedShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(bigRadius),
                side: const BorderSide(width: 0.25, color: Color.fromRGBO(41, 82, 56, 1.0)),
              ),
              children: <Widget>[
                _buildExpansionItem(context, '하나', '64791094453707', '전우소'),
                const SizedBox(height: 10),
                _buildExpansionItem(context, '신한', '110275673426', '이민리'),
                const SizedBox(height: 10),
                _buildExpansionItem(context, '우리', '1002347748808', '전보광'),
                const SizedBox(height: 10),
              ]
            ),
          ],
        ),
      ),
    );
  }
}
