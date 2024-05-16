import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xpert_autism/features/patient/presentation/cubit/patient_cubit.dart';
import 'package:xpert_autism/screens/fear_screen.dart';

class SurprisedScreen extends StatefulWidget {
  final Map<String, String> detectedEmotions;
  final String patientId;

  const SurprisedScreen({super.key, required this.detectedEmotions, required this.patientId});

  @override
  State<SurprisedScreen> createState() => _SurprisedScreenState();
}

class _SurprisedScreenState extends State<SurprisedScreen> {
  late PatientCubit patientCubit;

  int _currentImageIndex = 0;

  final _smilingImages = [
    "https://as2.ftcdn.net/v2/jpg/02/63/23/31/1000_F_263233162_xkLx0rHnv9iBrvKSkI2W1ng9eZzBa2OO.jpg",
    "https://as1.ftcdn.net/v2/jpg/01/40/43/74/1000_F_140437429_cVGVZyP6i8VWCS65Zjj4xmdMRduuS7fv.jpg",
  ];

  @override
  void initState() {
    super.initState();
    patientCubit = context.read<PatientCubit>();
    patientCubit.listenForEmotions(wantedEmotion: 'surprise'); // Start listening for surprise
    _startImageCarousel();
  }

  void _startImageCarousel() async {
    await Future.delayed(const Duration(minutes: 1)); // Wait for 1 minute
    while (mounted) {
      // Loop while screen is active
      setState(() {
        _currentImageIndex = (_currentImageIndex + 1) % _smilingImages.length;
      });
      await Future.delayed(const Duration(minutes: 1)); // Wait 5 seconds between images
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<PatientCubit, PatientState>(
        listener: (context, state) {
          state.whenOrNull(
            emotionDetected: (detectedEmotion) {
              setState(() {
                widget.detectedEmotions
                    .addAll({"surprise": detectedEmotion != "" ? detectedEmotion : "No Face Detected"});
              });

              print("EMOTION FINAL :$detectedEmotion");

              for (final entry in widget.detectedEmotions.entries) {
                print('Key: ${entry.key}, Value: ${entry.value}');
              }

              // Navigator.of(context).pushReplacementNamed(CustomRouter.sadScreen, arguments: detectedEmotion);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => FearScreen(
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
                'Suprise for the camera!',
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
