import 'package:flutter/material.dart';
import 'package:xpert_autism/common/main_button.dart';
import 'package:xpert_autism/features/patient/data/models/results_model.dart';
import 'package:xpert_autism/screens/neutral_screen.dart';

class OldResultsScreen extends StatefulWidget {
  final List<ResultsModel> results;
  final String patientId;

  const OldResultsScreen({super.key, required this.results, required this.patientId});

  @override
  State<OldResultsScreen> createState() => _OldResultsScreenState();
}

class _OldResultsScreenState extends State<OldResultsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
          width: 150,
          child: MainButton(
              text: "Retake test",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NeutralScreen(
                      patientId: widget.patientId,
                    ),
                  ),
                );
              },
              blue: true)),
      appBar: AppBar(
        title: const Text('Results'),
      ),
      body: PageView.builder(
        itemCount: widget.results.length,
        itemBuilder: (context, pageIndex) {
          final result = widget.results[pageIndex];

          final emotions = result.emotions;
          int calculateTrueResults(Map<String, String> detectedEmotions) {
            int trueCount = 0;
            final expectedEmotions = {
              "smile": "happy",
              "sad": "sad",
              "angry": "angry",
              "disgust": "disgust",
              "fear": "fear",
              "neutral": "neutral",
              "surprise": "surprise",
            };

            for (final entry in detectedEmotions.entries) {
              final expectedEmotion = expectedEmotions[entry.key.toLowerCase()];
              if (expectedEmotion != null && expectedEmotion.toLowerCase() == entry.value.toLowerCase()) {
                trueCount++;
              }
            }
            return trueCount;
          }

          double calculateTrueResultPercentage(Map<String, String> detectedEmotions) {
            final trueCount = calculateTrueResults(detectedEmotions);
            final totalSteps = detectedEmotions.length;
            if (totalSteps == 0) return 0.0;
            return (trueCount / totalSteps) * 100;
          }

          final trueResultPercentage = calculateTrueResultPercentage(emotions);

          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    'Result: ${pageIndex + 1}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    'Successfully emitted ${trueResultPercentage.toStringAsFixed(1)}% of the test steps.',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                Divider(),
                SizedBox(
                  height: 500,
                  child: ListView.separated(
                    itemCount: emotions.length,
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (context, index) {
                      final entry = emotions.entries.elementAt(index);
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                        child: Text(
                          'Step ${index + 1} (${entry.key}): ${entry.value}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
