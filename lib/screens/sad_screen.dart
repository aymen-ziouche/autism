import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:xpert_autism/features/patient/presentation/cubit/patient_cubit.dart';
import 'package:xpert_autism/screens/surprised_screen.dart';

class SadScreen extends StatefulWidget {
  final Map<String, String> detectedEmotions;
  final String patientId;

  const SadScreen({super.key, required this.detectedEmotions, required this.patientId});

  @override
  State<SadScreen> createState() => _SadScreenState();
}

class _SadScreenState extends State<SadScreen> {
  late PatientCubit patientCubit;

  int _currentImageIndex = 0;
  FlutterTts flutterTts = FlutterTts();

  final _smilingImages = [
    "https://as1.ftcdn.net/v2/jpg/00/48/88/36/1000_F_48883681_3YSVqKeyIvDNGZ9t0A8ynIFaeo64sHDm.jpg",
    "https://as2.ftcdn.net/v2/jpg/00/56/84/07/1000_F_56840755_LsWpSjHjWX0jQMIseKAMMESzdwTf8yxJ.jpg",
  ];

  @override
  void initState() {
    super.initState();
    patientCubit = context.read<PatientCubit>();
    patientCubit.listenForEmotions(wantedEmotion: 'sad'); // Start listening for sad
    _startImageCarousel();
  }

  void _startImageCarousel() async {
    await flutterTts.setLanguage("ar-SA");

    while (mounted) {
      // Loop while screen is active
      setState(() {
        _currentImageIndex = (_currentImageIndex + 1) % _smilingImages.length;
      });

      await flutterTts.speak("اِحْزَنْ");

      await Future.delayed(const Duration(seconds: 27));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<PatientCubit, PatientState>(
        listener: (context, state) {
          state.whenOrNull(
            emotionDetected: (detectedEmotion) async {
              setState(() {
                widget.detectedEmotions
                    .addAll({"Sad": detectedEmotion != "" ? detectedEmotion : "No Face Detected"});
              });

              print("EMOTION FINAL :$detectedEmotion");

              for (final entry in widget.detectedEmotions.entries) {
                print('Key: ${entry.key}, Value: ${entry.value}');
              }
              await flutterTts.stop();

              // Navigator.of(context).pushReplacementNamed(CustomRouter.sadScreen, arguments: detectedEmotion);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => SurprisedScreen(
                    detectedEmotions: widget.detectedEmotions,
                    patientId: widget.patientId,
                  ),
                ),
              );
            },
          );
        },
        builder: (context, state) {
          return Column(
            children: [
              Image.network(
                _smilingImages[_currentImageIndex],
                fit: BoxFit.cover,
                height: 500,
              ),
              const SizedBox(height: 15),
              const Text(
                'Frown for the camera!',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.red,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
