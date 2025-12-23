import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:wedding_invitation/common/strings.dart';
import 'package:wedding_invitation/section_title.dart';

class Guide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final autoSizeGroup = AutoSizeGroup();
    final mealDescriptionLines = [
      tr2(ko: '식사는 코스요리이며, 맥주는 무제한으로 제공됩니다.', en: 'A course meal will be served, and beer is provided unlimited.'),
      tr2(ko: '식사는 예식 30분 전부터 가능합니다.', en: 'You can dine on the 3rd floor after the ceremony.'),
      tr2(ko: '2층에서 식과 함께 먼저 식사할 수 있고,', en: ''),
      tr2(ko: '3층에서 예식 이후 식사할 수 있습니다.', en: ''),
    ];
    final additionalInfoLines = [
      '화환은 정중히 사양합니다.',
      '식장에는 ATM이 없지만,',
      '식장 주변에 여러 은행 지점이 있습니다.',
    ];

    return Container(
      width: 500.0,
      margin: const EdgeInsetsDirectional.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SectionTitle(
            text: tr2(ko: '안내사항', en: 'Guest Guide'),
            spacingTop: 80.0,
          ),
          const SizedBox(height: 20.0),
          Text(
            tr2(ko: '식사 안내', en: 'Meal Info'),
            style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, height: 3),
          ),
          Column(
            children: mealDescriptionLines.map((line) => AutoSizeText(
              line,
              style: const TextStyle(
                height: 2, 
                fontWeight: FontWeight.w300,
                fontFamily: 'Pretendard',
              ),
              textAlign: TextAlign.center,
              group: autoSizeGroup,
              maxLines: 1,
              minFontSize: 10,
            )).toList(),
          ),
          // Text(
          //   '예식 안내',
          //   style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, height: 3),
          // ),
          // Text(
          //   '예식 많이 즐겨주세요!\n'
          //   '사진 많이 찍어주세요!\n'
          //   '박수 많이 쳐주세요!\n'
          //   '호응 많이 해주세요!',
          //   style: TextStyle(height: 2,),
          //   textAlign: TextAlign.center,
          // ),
          //Text(
          //  '꿀팁 안내',
          //  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, height: 3),
          //),
          //Text(
          //  '숨어있는 전보광 친필사인을 찾아라!\n'
          //  '청첩장에 번호가 무엇이냐!\n'
          //  '축가는 세계 최고라던데!',
          //  style: TextStyle(height: 2,),
          //  textAlign: TextAlign.center,
          //),
          if (AppLocale.isKo) ...[
            const SizedBox(height: 10),
            const Text(
              '추가 안내',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, height: 3),
            ),
            Column(
              children: additionalInfoLines.map((line) => AutoSizeText(
                line,
                style: const TextStyle(
                  height: 2, 
                  fontWeight: FontWeight.w300,
                  fontFamily: 'Pretendard',
                ),
                textAlign: TextAlign.center,
                group: autoSizeGroup,
                maxLines: 1,
                minFontSize: 10,
              )).toList(),
            ),
          ],
          const SizedBox(height: 40),
          const SizedBox(height: 40),
        ],
      )
    );
  }
}
