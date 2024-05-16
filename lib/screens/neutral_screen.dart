import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xpert_autism/features/patient/presentation/cubit/patient_cubit.dart';
import 'package:xpert_autism/screens/smiling_screen.dart';
import 'package:youtube_video_player/potrait_player.dart';

class NeutralScreen extends StatefulWidget {
  final String patientId;
  const NeutralScreen({super.key, required this.patientId});

  @override
  State<NeutralScreen> createState() => _NeutralScreenState();
}

class _NeutralScreenState extends State<NeutralScreen> {
  late PatientCubit patientCubit;

  Map<String, String> _detectedEmotions = {};

  @override
  void initState() {
    super.initState();
    patientCubit = context.read<PatientCubit>();
    patientCubit.listenForEmotions(wantedEmotion: 'neutral'); // Start listening
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
                _detectedEmotions.addAll({"Neutral": detectedEmotion});
              });

              // Navigator.of(context).pushReplacementNamed(CustomRouter.smilingScreen, arguments: detectedEmotion);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => SmilingScreen(
                    detectedEmotions: _detectedEmotions,
                    patientId: widget.patientId,
                  ),
                ),
              );
            },
          );
        },
        builder: (context, state) {
          return const Column(
            children: [
              PotraitPlayer(
                link: 'https://www.youtube.com/watch?v=8jmK6C3Q6ys',
                aspectRatio: 9 / 15,
              ),
              SizedBox(height: 15),
              Text(
                'look at the camera!',
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
