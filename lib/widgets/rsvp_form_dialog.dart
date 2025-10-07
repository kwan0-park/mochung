import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

enum AttendChoice { can, cannot }
enum PartySide { groom, bride }

class RsvpFormDialog extends StatefulWidget {
  const RsvpFormDialog({super.key});

  @override
  State<RsvpFormDialog> createState() => _RsvpFormDialogState();
}

class _RsvpFormDialogState extends State<RsvpFormDialog> {
  final _formKey = GlobalKey<FormState>();

  // 상태값
  AttendChoice _attend = AttendChoice.can; // 기본: 참석 가능
  PartySide _side = PartySide.groom;       // 기본: 신랑측
  final _nameCtrl = TextEditingController(text: '');
  String? _meal = '식사 가능';              // 식사 여부
  String? _extra = '동행인 없음';           // 추가 인원
  bool _agree = false;

  // 콤보 옵션
  static const mealOptions = ['식사 가능', '식사 불가', '미정'];
  static const extraOptions = ['동행인 없음', '외 1명', '외 2명', '외 3명', '외 4명', '외 5명'];

  @override
  void dispose() {
    _nameCtrl.dispose();
    super.dispose();
  }

  int _getCompanionCount() {
    const companionMap = {
      '동행인 없음': 0,
      '외 1명': 1,
      '외 2명': 2,
      '외 3명': 3,
      '외 4명': 4,
      '외 5명': 5,
    };
    return companionMap[_extra] ?? 0;
  }

  void _submit() async {
    if (!_agree) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('개인정보 수집 및 이용에 동의해 주세요.')),
      );
      return;
    }

    if (_formKey.currentState?.validate() != true) return;

    final supabase = Supabase.instance.client;
    final payload = {
      'name': _nameCtrl.text.trim(),
      'side': _side == PartySide.groom ? '신랑측' : '신부측',
      'attend': _attend == AttendChoice.can,
      'meal': _attend == AttendChoice.can ? _meal : null,
      'companion': _attend == AttendChoice.can ? _getCompanionCount() : 0,
      'agree': _agree,
    };

    try {
      await supabase.from('rsvp_responses').insert(payload);

      if (mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('참석 정보가 성공적으로 전달되었습니다.')),
        );
      }
    } catch (error) {
      debugPrint('Supabase insert error: $error');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('오류가 발생했습니다. 다시 시도해 주세요.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    const divider = Divider(height: 32);

    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 640),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // 상단 바
                Row(
                  children: [
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.of(context).pop(),
                      tooltip: '닫기',
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                const Text(
                  '참석 정보 전달하기 (RSVP)',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 12),
                divider,

                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // 1) 참석 여부 섹션
                      const _SectionTitle('참석 여부를 선택해 주세요.'),
                      _AttendSegment(
                        value: _attend,
                        onChanged: (v) => setState(() {
                          _attend = v;
                          // 참석 불가로 전환 시 식사/추가인원 초기화
                          if (_attend == AttendChoice.cannot) {
                            _meal = null;
                            _extra = null;
                          }
                        }),
                      ),
                      const SizedBox(height: 20),

                      // 2) 신랑/신부측 + 입력 항목
                      const _SectionTitle('신랑 & 신부에게 전달될 정보를 입력해 주세요.'),
                      _SideSegment(
                        value: _side,
                        onChanged: (v) => setState(() => _side = v),
                      ),
                      const SizedBox(height: 16),

                      // 성함
                      const _Labeled('* 성함'),
                      TextFormField(
                        controller: _nameCtrl,
                        decoration: const InputDecoration(
                          hintText: '홍길동',
                          isDense: true,
                          border: UnderlineInputBorder(),
                        ),
                        validator: (v) => (v == null || v.trim().isEmpty) ? '성함을 입력해 주세요.' : null,
                      ),
                      const SizedBox(height: 16),

                      // 참석 가능일 때만 노출되는 항목들
                      if (_attend == AttendChoice.can) ...[
                        const _Labeled('* 식사 여부'),
                        DropdownButtonFormField<String>(
                          value: _meal,
                          isExpanded: true,
                          decoration: const InputDecoration(
                            isDense: true,
                            border: UnderlineInputBorder(),
                          ),
                          items: mealOptions
                              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                              .toList(),
                          onChanged: (v) => setState(() => _meal = v),
                          validator: (v) => v == null ? '식사 여부를 선택해 주세요.' : null,
                        ),
                        const SizedBox(height: 16),

                        const _Labeled('* 추가 인원'),
                        DropdownButtonFormField<String>(
                          value: _extra,
                          isExpanded: true,
                          decoration: const InputDecoration(
                            isDense: true,
                            border: UnderlineInputBorder(),
                          ),
                          items: extraOptions
                              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                              .toList(),
                          onChanged: (v) => setState(() => _extra = v),
                          validator: (v) => v == null ? '추가 인원을 선택해 주세요.' : null,
                        ),
                        const SizedBox(height: 16),
                      ],

                      divider,

                      // 개인정보 동의
                      _ConsentCard(
                        checked: _agree,
                        onChanged: (v) => setState(() => _agree = v ?? false),
                      ),
                      const SizedBox(height: 16),

                      // 제출 버튼
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _submit,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            minimumSize: const Size.fromHeight(56),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 0,
                          ),
                          child: const Text(
                            '신랑 & 신부에게 참석 정보 전달하기',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ======= 소형 컴포넌트들 =======

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}

class _Labeled extends StatelessWidget {
  const _Labeled(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Text(
          text,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

/// 참석 가능/불가 (좌우 토글, 기본 '참석 가능')
class _AttendSegment extends StatelessWidget {
  const _AttendSegment({required this.value, required this.onChanged});
  final AttendChoice value;
  final ValueChanged<AttendChoice> onChanged;

  @override
  Widget build(BuildContext context) {
    const selectedColor = Color(0xFF2F2F2F);
    const unselectedColor = Color(0xFFEDEDED);

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Row(
        children: [
          Expanded(
            child: _SegmentButton(
              selected: value == AttendChoice.can,
              selectedColor: selectedColor,
              unselectedColor: unselectedColor,
              label: '참석 가능',
              icon: Icons.check,
              onTap: () => onChanged(AttendChoice.can),
              selectedIconColor: Colors.green,
            ),
          ),
          Expanded(
            child: _SegmentButton(
              selected: value == AttendChoice.cannot,
              selectedColor: selectedColor,
              unselectedColor: unselectedColor,
              label: '참석 불가',
              icon: Icons.close,
              onTap: () => onChanged(AttendChoice.cannot),
              selectedIconColor: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}

/// 신랑측/신부측 (핑크톤 강조)
class _SideSegment extends StatelessWidget {
  const _SideSegment({required this.value, required this.onChanged});
  final PartySide value;
  final ValueChanged<PartySide> onChanged;

  @override
  Widget build(BuildContext context) {
    const groomColor = Color(0xFF6B8E23); // 올리브그린
    const brideColor = Color(0xFFC5827D); // 핑크브라운

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Row(
        children: [
          Expanded(
            child: _FlatTab(
              label: '신랑측',
              selected: value == PartySide.groom,
              selectedColor: groomColor,
              onTap: () => onChanged(PartySide.groom),
              selectedTextColor: Colors.white,
            ),
          ),
          Expanded(
            child: _FlatTab(
              label: '신부측',
              selected: value == PartySide.bride,
              selectedColor: brideColor,
              onTap: () => onChanged(PartySide.bride),
              selectedTextColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class _SegmentButton extends StatelessWidget {
  const _SegmentButton({
    required this.selected,
    required this.selectedColor,
    required this.unselectedColor,
    required this.label,
    required this.icon,
    required this.onTap,
    this.selectedIconColor,
  });

  final bool selected;
  final Color selectedColor;
  final Color unselectedColor;
  final String label;
  final IconData icon;
  final VoidCallback onTap;
  final Color? selectedIconColor;

  @override
  Widget build(BuildContext context) {
    final bg = selected ? selectedColor : unselectedColor;
    final fg = selected ? Colors.white : const Color(0xFF6B6B6B);
    final iconColor = selected ? (selectedIconColor ?? fg) : fg;

    return Material(
      color: bg,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 18, color: iconColor),
              const SizedBox(width: 6),
              Text(label, style: TextStyle(color: fg, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }
}

class _FlatTab extends StatelessWidget {
  const _FlatTab({
    required this.label,
    required this.selected,
    required this.selectedColor,
    required this.onTap,
    this.selectedTextColor,
  });

  final String label;
  final bool selected;
  final Color selectedColor;
  final Color? selectedTextColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final bg = selected ? selectedColor : const Color(0xFFF5F5F5);
    final fg = selected ? (selectedTextColor ?? const Color(0xFF333333)) : const Color(0xFF999999);

    return Material(
      color: bg,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Center(
            child: Text(
              label,
              style: TextStyle(fontWeight: FontWeight.w600, color: fg),
            ),
          ),
        ),
      ),
    );
  }
}

class _ConsentCard extends StatelessWidget {
  const _ConsentCard({required this.checked, required this.onChanged});
  final bool checked;
  final ValueChanged<bool?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE5E5E5)),
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xFFFBFBFB),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('개인정보 수집 및 이용 동의(필수)',
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
          const SizedBox(height: 8),
          const Text(
            '참석 정보 전달을 위한 개인정보 수집 및 이용에 동의해 주세요.\n'
            '항목: 성함, 연락처, 동행인 성함 · 보유기간: 청첩장 이용 종료시 까지',
            style: TextStyle(fontSize: 12, color: Color(0xFF6B6B6B), height: 1.4),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Checkbox(value: checked, onChanged: onChanged),
              const SizedBox(width: 4),
              const Text('동의합니다', style: TextStyle(fontWeight: FontWeight.w600)),
              const Text('  *', style: TextStyle(color: Colors.red)),
            ],
          ),
        ],
      ),
    );
  }
}