import "dart:math";
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:wedding_invitation/widgets/welcome.dart';
import 'package:wedding_invitation/widgets/invitation.dart';
import 'package:wedding_invitation/widgets/story.dart';
import 'package:wedding_invitation/widgets/gallery.dart';
import 'package:wedding_invitation/widgets/map.dart';
import 'package:wedding_invitation/widgets/guide.dart';
import 'package:wedding_invitation/widgets/bank_account.dart';
import 'package:wedding_invitation/widgets/developed_by.dart';
import 'package:wedding_invitation/widgets/attendance_modal.dart';
import 'package:wedding_invitation/widgets/rsvp_form_dialog.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

Path createBearPath(Size size) {
  final s = min(size.width, size.height); // 기준 스케일
  final path = Path();

    final faceW = 0.86 * s;
    final faceH = 0.72 * s;
    path.addOval(Rect.fromCenter(center: Offset(0, 0), width: faceW, height: faceH));

    final earW = 0.28 * s;
    final earH = 0.35 * s; 
    final earDx = 0.42 * s;
    final earUp = 0.40 *(5/16) * s; 

    path.addOval(Rect.fromCenter(center: Offset(-earDx, -earUp), width: earW, height: earH));
    path.addOval(Rect.fromCenter(center: Offset( earDx, -earUp), width: earW, height: earH));

    return path;
}


class _MyHomePageState extends State<MyHomePage> {
  // final controller = ConfettiController();
  final _controllerLeft = ConfettiController();
  final _controllerRight = ConfettiController();

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // controller.play();
    _controllerLeft.play();
    _controllerRight.play();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      openAttendanceFlow(context);
    });
  }

  void openAttendanceFlow(BuildContext context) {
    showAttendanceInfoDialog(
      context,
      onPrimaryPressed: () {
        Navigator.of(context).pop(); // 안내 모달 닫기
        showDialog(
          context: context,
          builder: (_) => const RsvpFormDialog(),
        );
      },
    );
  }

  @override
  void dispose() {
    // controller.dispose();
    _controllerLeft.dispose();
    _controllerRight.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Stack (
    alignment: Alignment.topCenter,
    children: [
      Scaffold (
        body: SingleChildScrollView (
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg_img_white.jpg'),
                repeat: ImageRepeat.repeat,
                opacity: 0.3,
              ),
            ),
            child: Column (
              children: [
                Welcome(),
                Invitation(),
                Story(),
                Gallery(imageProviders: GalleryImagePaths.imageProviders, width: 500.0,),
                Guide(),
                Map(),
                BankAccount(),
                DevelopedBy(),
              ],
            ),
          ),
        ),
      ),
      
      // ConfettiWidget(
      //   confettiController: controller,
      //   shouldLoop: false,

      //   blastDirectionality: BlastDirectionality.explosive,
      //   emissionFrequency: 0.01,
      //   numberOfParticles: 1,
      //   gravity: 0.05,
      //   particleDrag: 0.3,

      //   createParticlePath: (_) => createBearPath(const Size(24, 24)),
      // ),
      
      Stack(
        children: [
          // 왼쪽 위 Confetti
          Align(
            alignment: Alignment.topLeft,
            child: ConfettiWidget(
              confettiController: _controllerLeft,
              // blastDirectionality: BlastDirectionality.explosive,
              blastDirectionality: BlastDirectionality.directional,
              blastDirection: pi * 1/4,
              emissionFrequency: 0.015,
              numberOfParticles: 1,
              minBlastForce: 3,
              maxBlastForce: 8,
              minimumSize: const Size(12, 12),
              maximumSize: const Size(24, 24),
              gravity: 0.05,
              particleDrag: 0.25,
              colors: const [Colors.brown, Colors.amber, Colors.orange, Color.fromARGB(181, 241, 122, 42)],
              createParticlePath: createBearPath,
              // createParticlePath: (_) => createBearPath(const Size(18, 18)),
            ),
          ),
          // 오른쪽 위 Confetti
          Align(
            alignment: Alignment.topRight,
            child: ConfettiWidget(
              confettiController: _controllerRight,
              // blastDirectionality: BlastDirectionality.explosive,
              blastDirectionality: BlastDirectionality.directional,
              blastDirection: pi * 3/4,
              emissionFrequency: 0.015,
              numberOfParticles: 1,
              minBlastForce: 3,
              maxBlastForce: 8,
              minimumSize: const Size(12, 12),
              maximumSize: const Size(24, 24),
              gravity: 0.05,
              particleDrag: 0.25,
              colors: const [Colors.brown, Colors.amber, Colors.orange, Color.fromARGB(181, 241, 122, 42)],
              createParticlePath: createBearPath,
              // createParticlePath: (_) => createBearPath(const Size(18, 18)),
            ),
          ),
        ],
      ),
    ],
  );
}