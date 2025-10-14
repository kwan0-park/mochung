import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/services.dart';
import 'package:wedding_invitation/common/global_variable.dart';

class BankAccount extends StatelessWidget {
  void _copyToClipboard(String text, BuildContext context) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('계좌번호가 복사되었습니다.'),
      ),
    );
  }

  Widget _buildExpansionItem(BuildContext context, String relationship, String bank, String account, String name, Color inputColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(relationship, style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: inputColor)),
                const SizedBox(height: 4),
                Text(account, style: const TextStyle(fontSize: 14.0)),
                const SizedBox(height: 4),
                Text('$bank $name', style: const TextStyle(fontSize: 14.0)),
              ],
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: () {
              Clipboard.setData(ClipboardData(text: account));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("계좌번호가 복사되었습니다.")),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: inputColor,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(bigRadius),
              ),
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
                  '       신랑측',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: indiBlueColor),
                ),
              ),
              initiallyExpanded: false,
              backgroundColor: Colors.white,
              collapsedBackgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(bigRadius),
                side: const BorderSide(width: 0.25, color: primaryColor),
              ),
              collapsedShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(bigRadius),
                side: const BorderSide(width: 0.25, color: primaryColor),
              ),
              children: <Widget>[
                _buildExpansionItem(context, '신랑', '새마을금고', '9003-242628-139', '박관영', indiBlueColor),
                const SizedBox(height: 10),
                _buildExpansionItem(context, '신랑 아버지', '국민은행', '057-24-0338-924', '박봉희', indiBlueColor),
                const SizedBox(height: 10),
                _buildExpansionItem(context, '신랑 어머니', '국민은행', '353-21-0165-491', '김순례', indiBlueColor),
                const SizedBox(height: 10),
              ]
            ),
            const SizedBox(height: 10),
            ExpansionTile(
              title: Center(
                child: Text(
                  '       신부측',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: indiPinkColor),
                ),
              ),
              initiallyExpanded: false,
              backgroundColor: Colors.white,
              collapsedBackgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(bigRadius),
                side: const BorderSide(width: 0.25, color: primaryColor),
              ),
              collapsedShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(bigRadius),
                side: const BorderSide(width: 0.25, color: primaryColor),
              ),
              children: <Widget>[
                _buildExpansionItem(context, '신부', '우리은행', '1002347748808', '전보광', indiPinkColor),
                const SizedBox(height: 10),
                _buildExpansionItem(context, '신부 아버지', '하나은행', '64791094453707', '전우소', indiPinkColor),
                const SizedBox(height: 10),
                _buildExpansionItem(context, '신부 어머니', '신한은행', '110275673426', '이민리', indiPinkColor),
                const SizedBox(height: 10),
              ]
            ),
          ],
        ),
      ),
    );
  }
}
