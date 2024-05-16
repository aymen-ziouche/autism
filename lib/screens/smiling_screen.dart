import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xpert_autism/features/patient/presentation/cubit/patient_cubit.dart';
import 'package:xpert_autism/screens/sad_screen.dart';

class SmilingScreen extends StatefulWidget {
  final Map<String, String> detectedEmotions;
  final String patientId;

  const SmilingScreen({super.key, required this.detectedEmotions, required this.patientId});

  @override
  State<SmilingScreen> createState() => _SmilingScreenState();
}

class _SmilingScreenState extends State<SmilingScreen> {
  late PatientCubit patientCubit;

  int _currentImageIndex = 0;

  final _smilingImages = [
    // Add paths or URLs to your smiling images here (replace with actual image assets)
    'https://st2.depositphotos.com/4431055/7492/i/950/depositphotos_74925449-stock-photo-men-human-face-smiling.jpg',
    'https://as2.ftcdn.net/v2/jpg/02/54/26/25/1000_F_254262588_wbdwGWgnETRzXZo49JBRLfkjnUybShBE.jpg',
  ];

  @override
  void initState() {
    super.initState();
    patientCubit = context.read<PatientCubit>();
    patientCubit.listenForEmotions(wantedEmotion: 'happy'); // Start listening for smiles
    _startImageCarousel();
  }

  void _startImageCarousel() async {
    await Future.delayed(const Duration(minutes: 1)); // Wait for 1 minute
    while (mounted) {
      // Loop while screen is active
      setState(() {
        _currentImageIndex = (_currentImageIndex + 1) % _smilingImages.length;
      });
      await Future.delayed(
        const Duration(minutes: 1),
      ); // Wait 5 seconds between images
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
              // add "Step 1 (smile): detected emotion"
              // _detectedEmotions
              setState(() {
                widget.detectedEmotions
                    .addAll({"Smile": detectedEmotion != "" ? detectedEmotion : "No Face Detected"});
              });
              print("EMOTION FINAL : $detectedEmotion");

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => SadScreen(
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
                'Smile for the camera!',
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
