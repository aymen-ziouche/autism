import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xpert_autism/features/patient/data/models/results_model.dart';
import 'package:xpert_autism/features/patient/presentation/cubit/patient_cubit.dart';

class ResultsScreen extends StatefulWidget {
  final Map<String, String> detectedEmotions;
  final String patientId;

  const ResultsScreen({super.key, required this.detectedEmotions, required this.patientId});

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  late PatientCubit patientCubit;

  @override
  void initState() {
    super.initState();
    patientCubit = context.read<PatientCubit>();
    final results = ResultsModel.fromMap(widget.detectedEmotions);
    patientCubit.saveResults(patientId: widget.patientId, results: results);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
