import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wedding_invitation/common/global_variable.dart';
import 'package:wedding_invitation/common/strings.dart';
import 'package:wedding_invitation/section_title.dart';

Widget _buildName(String father, String mother, String relation, String name) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      // 👨 첫 번째 묶음: 아버지 · 어머니
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              father,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Text(
            ' · ',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              mother,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      const SizedBox(width: 8), // 두 묶음 사이 간격

      // 👩 두 번째와 세 번째 묶음
      Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '의 $relation ',
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.normal,
            ),
          ),
          Text(
            ' $name',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ],
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
          child: AutoSizeText(who, style: TextStyle(color: color, fontWeight: FontWeight.bold), maxLines: 1),
        ),
      ),
      Expanded(
        flex: 2,
        child: Align(
          alignment: Alignment.center,
          child: Text('$name', style: const TextStyle(color: Colors.black)),
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
        const Divider(thickness: 1, height: 1,),
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
      style: TextStyle(color: primaryColor, fontWeight: FontWeight.w600)
    ),
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(bigRadius),
      ),
      padding: EdgeInsets.all(16.0),
      backgroundColor: const Color(0xFFFFFFFF),
      side: BorderSide(width: 0.5, color: primaryColor)
    ),
  );
}

class Invitation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final invitationLines = [
      tr2(
        ko: '손 꼭 잡고 함께 물 위를 떠다니는 두 해달처럼,',
        en: 'Like two otters floating hand in hand upon the water,',
      ),
      tr2(
        ko: '좋은 일도 힘든 일도',
        en: 'we have found someone',
      ),
      tr2(
        ko: '함께 하고 싶은 사람을 만났습니다.',
        en: 'to share both life\'s joys and challenges with.',
      ),
      tr2(
        ko: '흘러가는 시간 속에서도 서로를 놓지 않으며',
        en: 'As time flows by, we promise to hold on to one another,',
      ),
      tr2(
        ko: '따뜻한 하루하루를 함께 만들어가려 합니다.',
        en: 'and to create warm and loving days together.',
      ),
      tr2(
        ko: '귀한 걸음 하시어 새로운 시작을 축복해주시면',
        en: 'We would be honored if you would bless our new beginning,',
      ),
      tr2(
        ko: '감사한 마음으로 잘 살겠습니다.',
        en: 'as we move forward with hearts full of gratitude.',
      ),
    ];
    final autoSizeGroup = AutoSizeGroup();

    return Container(
      color: const Color(0xFFFFFFFF),
      child: Center(
        child: Container (
          width: 500.0,
          margin: const EdgeInsetsDirectional.all(20.0),
          child: Column (
            children: [
              SectionTitle(
                text: tr2(
                  ko: '소중하고 감사한 당신을 초대합니다.',
                  en: 'Welcome Invitations',
                ),
                spacingTop: 20.0,
              ),
              const SizedBox(height: 40),
              Container (
                height: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(bigRadius),
                  child: Image.asset(
                    'assets/images/invitation_otter_cropped.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Column(
                children: invitationLines.map((line) => AutoSizeText(
                  line,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 15,
                    height: 2,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Pretendard',
                  ),
                  maxLines: 1,
                  minFontSize: 10,
                  group: autoSizeGroup,
                )).toList(),
              ),

              const SizedBox(height: 50),
              _buildName(
                '전우소',
                '이민리',
                '장녀',
                tr2(ko: '보광', en: 'Bokwang'),
              ),
              const SizedBox(height: 10),
              _buildName(
                '박봉희',
                '김순례',
                '장남',
                tr2(ko: '관영', en: 'Kwnayoung'),
              ),
              const SizedBox(height: 50),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text(
                          '2026.02.08\n'
                          'Sun 1:00 PM',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'SpecialElite',
                          ),
                        ),
                        Text(
                          '일요일 오후 1시',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text(
                          'NOBLE VALENTI\n'
                          'SAMSEONG',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'SpecialElite',
                          ),
                        ),
                        Text(
                          '노블발렌티 삼성',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              _buildContactButton(context),
              const SizedBox(height: 40),
            ],
          )
        )
      ),
    );
  }
}
