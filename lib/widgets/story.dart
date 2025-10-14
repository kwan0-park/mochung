import 'package:flutter/material.dart';
import 'package:wedding_invitation/common/global_variable.dart';

class Story extends StatelessWidget {
  const Story({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 500.0,
        margin: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container (
              height: 100,
              child: Image.asset(
                'assets/images/boris_barbara.webp',
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 20.0),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 왼쪽 - A 인물 소개
                Expanded(
                  child: Center(
                    child: _PersonCard(
                      name: '박관영',
                      hobby: '음악, 수영',
                      personality: '차분하고 상냥함',
                      imagePath: 'assets/images/photos/person_pky_photos.webp',
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                // 오른쪽 - B 인물 소개
                Expanded(
                  child: Center(
                    child: _PersonCard(
                      name: '전보광',
                      hobby: '노래, 인테리어',
                      personality: '활발하고 긍정적',
                      imagePath: 'assets/images/photos/person_jbk_photos.webp',
                    ),
                  ),
                ),
              ],
            ),
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

  const _PersonCard({
    required this.name,
    required this.hobby,
    required this.personality,
    required this.imagePath,
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
            _InfoText(label: '이름', value: name),
            const SizedBox(height: 8.0),
            _InfoText(label: '취미', value: hobby),
            const SizedBox(height: 8.0),
            _InfoText(label: '성격', value: personality),
          ],
        ),
      ),
    );
  }
}

class _InfoText extends StatelessWidget {
  final String label;
  final String value;

  const _InfoText({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$label: ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontSize: 16.0,
            ),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
