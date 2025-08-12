import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:url_launcher/url_launcher.dart';

final Color indiBlueColor = Color.fromRGBO(102, 142, 170, 1.0);
final Color indiPinkColor = Color.fromRGBO(206, 131, 131, 1.0);

Widget _buildName(String father, mother, relation, name) {
  return Center (
    child: Row (
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$father · $mother', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text(' 의 $relation ', style: TextStyle(fontSize: 13)),
        Text(name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ],
    )
  );
}

void _launchPhoneCall(String phoneNumber) async {
  final uri = Uri.parse('tel:$phoneNumber');
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw '전화를 걸 수 없습니다: $uri';
  }
}

void _sendSms(String phoneNumber) async {
  final uri = Uri.parse('sms:$phoneNumber');
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw '문자를 보낼 수 없습니다: $uri';
  }
}

Widget _buildContactInfo(String who, name, number, Color color) {
  return Row (
    children: [
      Expanded(
        flex: 2,
        child: Align(
          alignment: Alignment.center,
          child: Text('$who', style: TextStyle(color: color)),
        ),
      ),
      Expanded(
        flex: 2,
        child: Align(
          alignment: Alignment.center,
          child: Text('$name', style: TextStyle(color: Colors.grey)),
        ),
      ),
      Expanded(
        flex: 1,
        child: Align(
          alignment: Alignment.center,
          child: TextButton(
            onPressed: () { _launchPhoneCall(number); },
            child: Icon(Icons.phone, color: color, size: 24.0),
          )
        ),
      ),
      Expanded(
        flex: 1,
        child: Align(
          alignment: Alignment.center,
          child: TextButton(
            onPressed: () { _sendSms(number); },
            child: Icon(Icons.email, color: color, size: 24.0),
          )
        ),
      ),
    ],
  );
}

Widget _buildPopUpContent() {
  return Container(
    width: 500.0,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildContactInfo('신랑', '박관영', '010-5586-2155', indiBlueColor),
        const SizedBox(height: 1),
        _buildContactInfo('신랑 아버지', '박봉희', '010-4280-2155', indiBlueColor),
        const SizedBox(height: 1),
        _buildContactInfo('신랑 어머니', '김순례', '010-3307-2155', indiBlueColor),

        const SizedBox(height: 10),
        Divider(thickness: 1, height: 1,),
        const SizedBox(height: 10),

        _buildContactInfo('신부', '전보광', '010-3228-3239', indiPinkColor),
        const SizedBox(height: 1),
        _buildContactInfo('신부 아버지', '전우소', '010-5170-7701', indiPinkColor),
        const SizedBox(height: 1),
        _buildContactInfo('신부 어머니', '이민리', '010-6670-3239', indiPinkColor),
      ],
    ),
  );
}


Widget _buildContactButton(BuildContext context) {
  return OutlinedButton(
    onPressed: () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
              /*child: Text('연락하기', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))*/),
            content: _buildPopUpContent(),
          );
        },
      );
    },
    child: Text(
      '                 📞 연락하기                  ',
      style: TextStyle(color: Color.fromRGBO(41, 82, 56, 100), fontWeight: FontWeight.w600)
    ),
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: EdgeInsets.all(16.0),
      backgroundColor: const Color(0xFFFFFFFF),
      side: BorderSide(width: 0.5, color: Color.fromRGBO(41, 82, 56, 100))
    ),
  );
}

class Invitation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container (
        width: 500.0,
        margin: const EdgeInsetsDirectional.all(20.0),
        child: Column (
          children: [
            Container (
              height: 100,
              child: Image.asset(
                'assets/images/couple2.png', 
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 40),
            const AutoSizeText(
              '잠들 때 서로의 손을 꼭 잡는 해달처럼,\n'
              '우리는 앞으로의 삶에서도 늘 손을 맞잡고 함께하겠습니다.\n'
              '흘러가는 시간 속에서도 서로를 놓지 않으며\n'
              '따뜻한 하루하루를 함께 만들어가려 합니다.\n'
              '저희 두 사람의 새로운 시작을\n'
              '여러분의 축복 속에서 함께하고 싶습니다.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                height: 2,
                fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 50),
            _buildName('박봉희', '김순례', '아들', '박관영'),
            const SizedBox(height: 10),
            _buildName('전우소', '이민리', '딸  ', '전보광'),
            const SizedBox(height: 50),
            /*
            Container (
              height: 350.0,
              child: Image.asset(
                'assets/images/invitation.png',
                fit: BoxFit.fitWidth,
              ),
            ),
            const SizedBox(height: 40),
            */
            _buildContactButton(context),
          ],
        )
      )
    );
  }
}