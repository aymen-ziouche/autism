import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xpert_autism/common/main_button.dart';
import 'package:xpert_autism/screens/neutral_screen.dart';

class OldResultsScreen extends StatefulWidget {
  final Map<String, String> detectedEmotions;
  final String patientId;

  const OldResultsScreen({super.key, required this.detectedEmotions, required this.patientId});

  @override
  State<OldResultsScreen> createState() => _OldResultsScreenState();
}

class _OldResultsScreenState extends State<OldResultsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
          width: 150.w,
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
      body: Center(
        child: ListView.separated(
          itemCount: widget.detectedEmotions.length,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) {
            final entry = widget.detectedEmotions.entries.elementAt(index);
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
    );
  }
}
