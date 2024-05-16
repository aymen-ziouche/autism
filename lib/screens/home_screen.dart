import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:xpert_autism/common/custom_router.dart';
import 'package:xpert_autism/common/main_button.dart';
import 'package:xpert_autism/features/patient/data/datasources/home_controller.dart';
import 'package:xpert_autism/features/patient/presentation/cubit/patient_cubit.dart';
import 'package:xpert_autism/screens/neutral_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PatientCubit patientCubit;
  final _homeController = HomeController();
  @override
  void initState() {
    super.initState();
    _homeController.loadCamera();
    patientCubit = context.read<PatientCubit>();
    patientCubit.getPatients();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PatientCubit, PatientState>(
      builder: (context, state) {
        return patientCubit.patients == null
            ? Scaffold(
                body: Center(child: Text("No patients")),
                floatingActionButton: SizedBox(
                    width: 150.w,
                    child: MainButton(
                        text: "Add Patient",
                        onTap: () {
                          Navigator.of(context).pushNamed(CustomRouter.addPatientScreen);
                        },
                        blue: true)),
              )
            : Scaffold(
                floatingActionButton: SizedBox(
                    width: 150.w,
                    child: MainButton(
                        text: "Add Patient",
                        onTap: () => Navigator.of(context).pushNamed(CustomRouter.addPatientScreen),
                        blue: true)),
                body: Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      final patient = patientCubit.patients![index];
                      String formattedDate = DateFormat('dd MMMM yyyy').format(patient.dateOfBirth);

                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NeutralScreen(
                                  patientId: patient.uid!,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            height: 120,
                            width: double.infinity,
                            decoration:
                                BoxDecoration(color: Colors.black12, borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FittedBox(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(Icons.person),
                                          const SizedBox(width: 10),
                                          Text(
                                            "Name: ",
                                            style: GoogleFonts.leagueSpartan(fontSize: 18, color: Colors.black),
                                          ),
                                          Text(
                                            "${patient.firstName} ${patient.lastName}",
                                            style: GoogleFonts.leagueSpartan(fontSize: 15, color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: [
                                          const Icon(Icons.medication_rounded),
                                          const SizedBox(width: 10),
                                          Text(
                                            "Autism Degree: ",
                                            style: GoogleFonts.leagueSpartan(fontSize: 18, color: Colors.black),
                                          ),
                                          Text(
                                            patient.autismDegree.toString(),
                                            style: GoogleFonts.leagueSpartan(fontSize: 15, color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          const Icon(Icons.calendar_month),
                                          const SizedBox(width: 10),
                                          Text(
                                            "Date of Birth: ",
                                            style: GoogleFonts.leagueSpartan(fontSize: 18, color: Colors.black),
                                          ),
                                          Text(
                                            formattedDate,
                                            style: GoogleFonts.leagueSpartan(fontSize: 15, color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: patientCubit.patients!.length,
                  ),
                ),
              );
      },
    );
  }
}
