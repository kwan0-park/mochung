import 'package:flutter/material.dart';

/// ==== 1) 이미지 같은 '안내 모달' ====
/// 사용법: showAttendanceInfoDialog(context, onSubmit: () { ... });
Future<void> showAttendanceInfoDialog(
  BuildContext context, {
  required VoidCallback onPrimaryPressed,
  String title = '참석정보 전달하기',
  String description =
      '축하의 마음으로 예식에 참석하시는\n모든 분들을 더욱 귀하게 모실 수 있도록\n참석 정보 전달을 부탁드립니다.',
  String dateTimeText = '2026.02.08. 일요일 1:00 PM',
  String streetAddress = '서울 강남구 봉은사로 637',
  String venueName = '노블발렌티 삼성점',
}) {
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (_) => Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 560),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min, // 내용 높이만큼만
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 상단 X 버튼 (Stack 없이 Row로)
              Row(
                children: [
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.close),
                    tooltip: '닫기',
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),

              const SizedBox(height: 4),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  height: 1.25,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 14,
                  height: 1.6,
                  color: Color(0xFF5A5A5A),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Divider(height: 1),
              const SizedBox(height: 16),

              _InfoRow(icon: Icons.event, text: dateTimeText),
              const SizedBox(height: 8),
              _InfoRow(icon: Icons.map, text: streetAddress),
              const SizedBox(height: 8),
              _InfoRow(icon: Icons.place, text: venueName),

              const SizedBox(height: 24),

              // 큰 CTA 버튼 (가로 꽉 차게)
              ElevatedButton(
                onPressed: onPrimaryPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  minimumSize: const Size.fromHeight(56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  '참석정보 전달하기',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    ),
  );
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.icon, required this.text});
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20, color: const Color(0xFF1F1F1F)),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 14, color: Color(0xFF1F1F1F)),
          ),
        ),
      ],
    );
  }
}

/// ==== 2) 기존 폼 모달(파일명 유지하고 싶으면 클래스명만 교체) ====
enum Attendance { attending, notAttending }

class AttendanceFormDialog extends StatefulWidget {
  const AttendanceFormDialog({super.key});

  @override
  State<AttendanceFormDialog> createState() => _AttendanceFormDialogState();
}

class _AttendanceFormDialogState extends State<AttendanceFormDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  Attendance? _attendance = Attendance.attending;
  int _accompanyingGuests = 0;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // TODO: 서버 전송/저장 로직
      debugPrint('Name: ${_nameController.text}');
      debugPrint('Attending: $_attendance');
      if (_attendance == Attendance.attending) {
        debugPrint('Accompanying Guests: $_accompanyingGuests');
      }
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('참석 정보 입력'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: '성함',
                  hintText: '성함을 입력해주세요',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '성함을 입력해주세요.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('참석 여부를 선택해주세요.'),
              ),
              RadioListTile<Attendance>(
                title: const Text('참석'),
                value: Attendance.attending,
                groupValue: _attendance,
                onChanged: (value) => setState(() => _attendance = value),
              ),
              RadioListTile<Attendance>(
                title: const Text('불참'),
                value: Attendance.notAttending,
                groupValue: _attendance,
                onChanged: (value) => setState(() => _attendance = value),
              ),
              if (_attendance == Attendance.attending)
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: '동반 인원 (본인 제외)',
                    hintText: '숫자만 입력해주세요',
                  ),
                  keyboardType: TextInputType.number,
                  initialValue: '0',
                  onChanged: (value) {
                    _accompanyingGuests = int.tryParse(value) ?? 0;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '동반 인원을 입력해주세요.';
                    }
                    if (int.tryParse(value) == null) {
                      return '숫자만 입력할 수 있습니다.';
                    }
                    return null;
                  },
                ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('나중에 하기'),
        ),
        FilledButton(
          onPressed: _submitForm,
          child: const Text('제출'),
        ),
      ],
    );
  }
}