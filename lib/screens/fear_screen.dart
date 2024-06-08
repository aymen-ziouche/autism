import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:xpert_autism/features/patient/presentation/cubit/patient_cubit.dart';
import 'package:xpert_autism/screens/disgust_screen.dart';

class FearScreen extends StatefulWidget {
  final Map<String, String> detectedEmotions;
  final String patientId;

  const FearScreen({super.key, required this.detectedEmotions, required this.patientId});

  @override
  State<FearScreen> createState() => _FearScreenState();
}

class _FearScreenState extends State<FearScreen> {
  late PatientCubit patientCubit;

  int _currentImageIndex = 0;
  FlutterTts flutterTts = FlutterTts();

  final _smilingImages = [
    "https://as1.ftcdn.net/v2/jpg/07/03/82/08/1000_F_703820824_6e67nTMNHLtxKGdNcvwGScDZeaEhgb9O.jpg",
    "https://as1.ftcdn.net/v2/jpg/04/64/04/92/1000_F_464049203_7Hi6CmkmYEsCOF5orTbZ1uqamyBOs0ZG.jpg",
  ];

  @override
  void initState() {
    super.initState();
    patientCubit = context.read<PatientCubit>();
    patientCubit.listenForEmotions(wantedEmotion: 'fear'); // Start listening for surprise
    _startImageCarousel();
  }

  void _startImageCarousel() async {
    await flutterTts.setLanguage("ar-SA");

    while (mounted) {
      // Loop while screen is active
      setState(() {
        _currentImageIndex = (_currentImageIndex + 1) % _smilingImages.length;
      });

      await flutterTts.speak("خَفْ");

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
                    .addAll({"fear": detectedEmotion != "" ? detectedEmotion : "No Face Detected"});
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
                  builder: (context) => DisgustScreen(
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
                'Fear for the camera!',
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
