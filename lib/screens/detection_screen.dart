import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:xpert_autism/common/custom_router.dart';
import 'package:xpert_autism/features/patient/data/datasources/home_controller.dart';
import 'package:xpert_autism/features/patient/presentation/cubit/patient_cubit.dart';
import 'package:youtube_video_player/potrait_player.dart';

class DetectionScreen extends StatefulWidget {
  const DetectionScreen({super.key});

  @override
  State<DetectionScreen> createState() => _DetectionScreenState();
}

class _DetectionScreenState extends State<DetectionScreen> {
  final _homeController = HomeController();
  late PatientCubit patientCubit;
  @override
  void initState() {
    super.initState();
    patientCubit = context.read<PatientCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<HomeController>(
        init: _homeController,
        initState: (_) async {
          await _homeController.loadCamera();
          // _homeController.startImageStream();
          patientCubit.listenForEmotions(wantedEmotion: 'neutral');
        },
        builder: (_) {
          return Column(
            children: [
              const PotraitPlayer(
                link: 'https://www.youtube.com/watch?v=8jmK6C3Q6ys',
                aspectRatio: 9 / 15,
              ),
              const SizedBox(height: 15),
              Text(
                '${_.label}',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.red,
                ),
              ),
              StreamBuilder<DateTime?>(
                stream: Stream.periodic(const Duration(milliseconds: 500)),
                builder: (context, snapshot) {
                  if (_homeController.faceDetectedTime != null) {
                    var elapsedTime = DateTime.now().difference(_homeController.faceDetectedTime!);
                    if (elapsedTime.inSeconds >= 10) {
                      // Face detected for 10 seconds, navigate to another screen
                      Future.delayed(Duration.zero, () {
                        Navigator.of(context).pushReplacementNamed(CustomRouter.smilingScreen);
                        _homeController.faceDetectedTime = null; // Reset timer
                      });
                    }
                  }
                  return Container(); // Placeholder
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
