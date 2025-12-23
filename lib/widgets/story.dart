import 'package:flutter/material.dart';
import 'package:wedding_invitation/common/global_variable.dart';
import 'package:wedding_invitation/common/strings.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:wedding_invitation/section_title.dart';

class Story extends StatelessWidget {
  const Story({super.key});

  @override
  Widget build(BuildContext context) {
    final hashtagAutoSizeGroup = AutoSizeGroup();
    final nameGroup = AutoSizeGroup();
    final hobbyGroup = AutoSizeGroup();
    final personalityGroup = AutoSizeGroup();

    return Center(
      child: Container(
        width: 500.0,
        margin: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SectionTitle(
              text: tr2(ko: '우리들의 이야기', en: 'Our Story'),
              spacingTop: 80.0,
            ),
            const SizedBox(height: 20.0),
            Container (
              height: 100,
              child: Image.asset(
                'assets/images/boris_barbara.webp',
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 왼쪽 - A 인물 소개
                Expanded(
                  child: Center(
                    child: _PersonCard(
                      name: tr2(ko: '박관영', en: 'Kwanyoung Park'),
                      hobby: tr2(ko: '음악, 수영', en: 'Music, Swimming'),
                      personality: tr2(ko: '차분하고 상냥함', en: 'Calm and gentle'),
                      imagePath: 'assets/images/photos/person_pky_photos.webp',
                      hashtag: tr2(ko: '#상냥함 #무던함 #ENTJ', en: '#Gentle #Easygoing #ENTJ'),
                      hashtagLine1: tr2(ko: '#한결 같은 긍정적인 에너지', en: '#Positive energy'),
                      hashtagLine2: tr2(ko: '#흔들리지 않는 듬직함', en: '#Reliable'),
                      hashtagLine3: tr2(ko: '#예측 불가 넘치는 애교', en: '#Unexpected cuteness'),
                      autoSizeGroup: hashtagAutoSizeGroup,
                      nameGroup: nameGroup,
                      hobbyGroup: hobbyGroup,
                      personalityGroup: personalityGroup,
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                // 오른쪽 - B 인물 소개
                Expanded(
                  child: Center(
                    child: _PersonCard(
                      name: tr2(ko: '전보광', en: 'Bokwang Jeon'),
                      hobby: tr2(ko: '노래, 인테리어', en: 'Singing, Interior Design'),
                      personality: tr2(ko: '활발하고 긍정적', en: 'Energetic and Positive'),
                      imagePath: 'assets/images/photos/person_jbk_photos.webp',
                      hashtag: tr2(ko: '#명랑 #리더십 #ENFJ', en: '#Lively #Leadership #ENFJ'),
                      hashtagLine1: tr2(ko: '#감동적인 배려심', en: '#Considerate'),
                      hashtagLine2: tr2(ko: '#언제나 통통 튀는 매력', en: '#Always confident'),
                      hashtagLine3: tr2(ko: '#지켜주고 싶은 귀여움', en: '#Cuteness worth protecting'),
                      autoSizeGroup: hashtagAutoSizeGroup,
                      nameGroup: nameGroup,
                      hobbyGroup: hobbyGroup,
                      personalityGroup: personalityGroup,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40.0),
            const SizedBox(height: 40.0),
          ],
        ),
      ),
    );
  }
}

class _PersonCard extends StatelessWidget {
  final String name;
  final String hobby;
  final String personality;
  final String imagePath;
  final String hashtag;
  final String? hashtagLine1;
  final String? hashtagLine2;
  final String? hashtagLine3;
  final AutoSizeGroup autoSizeGroup;
  final AutoSizeGroup nameGroup;
  final AutoSizeGroup hobbyGroup;
  final AutoSizeGroup personalityGroup;

  const _PersonCard({
    required this.name,
    required this.hobby,
    required this.personality,
    required this.imagePath,
    required this.hashtag,
    this.hashtagLine1,
    this.hashtagLine2,
    this.hashtagLine3,
    required this.autoSizeGroup,
    required this.nameGroup,
    required this.hobbyGroup,
    required this.personalityGroup,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(bigRadius),
        side: const BorderSide(width: 0.25, color: primaryColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 사진
            ClipRRect(
              borderRadius: BorderRadius.circular(smallRadius),
              child: Image.asset(
                imagePath,
                height: 200.0,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 200.0,
                    width: double.infinity,
                    color: Colors.grey[300],
                    child: const Icon(
                      Icons.person,
                      size: 80.0,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16.0),
            // 인물 정보
            _InfoText(label: '이름', value: name, group: nameGroup),
            const SizedBox(height: 8.0),
            _InfoText(label: '취미', value: hobby, group: hobbyGroup),
            // const SizedBox(height: 8.0),
            // _InfoText(label: '성격', value: personality, group: personalityGroup),
            const SizedBox(height: 16.0),
            AutoSizeText(
              hashtag,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 14.0,
              ),
              maxLines: 2,
              minFontSize: 10,
              group: autoSizeGroup,
            ),
            const SizedBox(height: 8.0),
            if (hashtagLine1 != null)
              AutoSizeText(
                hashtagLine1!,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14.0,
                ),
                maxLines: 1,
                minFontSize: 10,
                group: autoSizeGroup,
              ),
            if (hashtagLine2 != null)
              AutoSizeText(
                hashtagLine2!,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14.0,
                ),
                maxLines: 1,
                minFontSize: 10,
                group: autoSizeGroup,
              ),
            if (hashtagLine3 != null)
              AutoSizeText(
                hashtagLine3!,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14.0,
                ),
                maxLines: 1,
                minFontSize: 10,
                group: autoSizeGroup,
              ),
          ],
        ),
      ),
    );
  }
}

class _InfoText extends StatelessWidget {
  final String label;
  final String value;
  final AutoSizeGroup? group;

  const _InfoText({
    required this.label,
    required this.value,
    this.group,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          '$label: ',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 14.0,
          ),
        ),
        Expanded(
          child: AutoSizeText(
            value,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 14.0,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            group: group,
            minFontSize: 10,
          ),
        ),
      ],
    );
  }
}
