
import 'package:flutter/material.dart';

enum Attendance { attending, notAttending }

class AttendanceModal extends StatefulWidget {
  const AttendanceModal({super.key});

  @override
  State<AttendanceModal> createState() => _AttendanceModalState();
}

class _AttendanceModalState extends State<AttendanceModal> {
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
      // For now, just print the data to the console.
      // In a real app, you'd send this to a server.
      print('Name: \${_nameController.text}');
      print('Attending: \$_attendance');
      if (_attendance == Attendance.attending) {
        print('Accompanying Guests: \$_accompanyingGuests');
      }
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('참석 여부 전달'),
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
              const Text('참석 여부를 선택해주세요.'),
              RadioListTile<Attendance>(
                title: const Text('참석'),
                value: Attendance.attending,
                groupValue: _attendance,
                onChanged: (value) {
                  setState(() {
                    _attendance = value;
                  });
                },
              ),
              RadioListTile<Attendance>(
                title: const Text('불참'),
                value: Attendance.notAttending,
                groupValue: _attendance,
                onChanged: (value) {
                  setState(() {
                    _attendance = value;
                  });
                },
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
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
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
