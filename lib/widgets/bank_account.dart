import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/services.dart';
import 'dart:html' as html;
import 'dart:ui' as ui;

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

  Widget _buildExpansionItem(BuildContext context, String bank, String accountNumber, String owner) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, // 여기를 추가하여 가운데 정렬
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                bank + ' ' + accountNumber + ' (' + owner + ')    ',
                style: TextStyle(fontWeight: FontWeight.w200,)
              ),
              ElevatedButton(
                onPressed: () {
                  _copyToClipboard(accountNumber, context);
                },
                child: const Text('복사하기'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green
                )
              ),
            ],
          ),
        ),
      ],
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
                borderRadius: BorderRadius.circular(20.0),
                side: const BorderSide(width: 0.25, color: Color.fromRGBO(41, 82, 56, 1.0)),
              ),
              collapsedShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                side: const BorderSide(width: 0.25, color: Color.fromRGBO(41, 82, 56, 1.0)),
              ),
              children: <Widget>[
                _buildExpansionItem(context, '국민은행', '057-24-0338-924', '박봉희'),
                const SizedBox(height: 10),
                _buildExpansionItem(context, '국민은행', '353-21-0165-491', '김순례'),
                const SizedBox(height: 10),
                _buildExpansionItem(context, '새마을금고', '9003-242628-139', '박관영'),
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
                borderRadius: BorderRadius.circular(20.0),
                side: const BorderSide(width: 0.25, color: Color.fromRGBO(41, 82, 56, 1.0)),
              ),
              collapsedShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                side: const BorderSide(width: 0.25, color: Color.fromRGBO(41, 82, 56, 1.0)),
              ),
              children: <Widget>[
                _buildExpansionItem(context, '대전', 'TBD', '전우소'),
                const SizedBox(height: 10),
                _buildExpansionItem(context, '대전', 'TBD', '이민리'),
                const SizedBox(height: 10),
                _buildExpansionItem(context, '카카오뱅크', '3333-0987-73509', '전보광'),
              ]
            ),
          ],
        ),
      ),
    );
  }
}
