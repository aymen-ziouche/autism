import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xpert_autism/features/patient/presentation/cubit/patient_cubit.dart';
import 'package:xpert_autism/screens/results_screen.dart';

class AngryScreen extends StatefulWidget {
  final Map<String, String> detectedEmotions;
  final String patientId;

  const AngryScreen({super.key, required this.detectedEmotions, required this.patientId});

  @override
  State<AngryScreen> createState() => _AngryScreenState();
}

class _AngryScreenState extends State<AngryScreen> {
  late PatientCubit patientCubit;

  int _currentImageIndex = 0;

  final _smilingImages = [
    "https://as1.ftcdn.net/v2/jpg/01/93/28/06/1000_F_193280620_TZsrxiUCIvgsdHfvxewjmrd4jVNA51MP.jpg",
    "https://cdn.mos.cms.futurecdn.net/DMUbjq2UjJcG3umGv3Qjjd-970-80.jpeg.webp",
  ];

  @override
  void initState() {
    super.initState();
    patientCubit = context.read<PatientCubit>();
    patientCubit.listenForEmotions(wantedEmotion: 'angry'); // Start listening for surprise
    _startImageCarousel();
  }

  void _startImageCarousel() async {
    await Future.delayed(const Duration(minutes: 1)); // Wait for 1 minute
    while (mounted) {
      // Loop while screen is active
      setState(() {
        _currentImageIndex = (_currentImageIndex + 1) % _smilingImages.length;
      });
      await Future.delayed(const Duration(minutes: 1)); // Wait 1 minute between images
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
                    .addAll({"angry": detectedEmotion != "" ? detectedEmotion : "No Face Detected"});
              });

              print("EMOTION FINAL :$detectedEmotion");

              for (final entry in widget.detectedEmotions.entries) {
                print('Key: ${entry.key}, Value: ${entry.value}');
              }

              // Navigator.of(context).pushReplacementNamed(CustomRouter.sadScreen, arguments: detectedEmotion);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsScreen(
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
                'angry for the camera!',
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
