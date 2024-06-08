import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xpert_autism/common/custom_dialog.dart';
import 'package:xpert_autism/common/custom_theme.dart';
import 'package:xpert_autism/common/main_button.dart';
import 'package:xpert_autism/features/patient/data/models/patient_model.dart';
import 'package:xpert_autism/features/patient/presentation/cubit/patient_cubit.dart';
import 'package:xpert_autism/features/patient/presentation/widgets/custom_form_field.dart';
import 'package:intl/intl.dart';
import 'package:xpert_autism/screens/home_screen.dart';

class AddPatientScreen extends StatefulWidget {
  const AddPatientScreen({super.key});

  @override
  State<AddPatientScreen> createState() => _AddPatientScreenState();
}

class _AddPatientScreenState extends State<AddPatientScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _firstNameFieldController = TextEditingController();
  final _lastNameFieldController = TextEditingController();
  DateTime? _selectedDate;
  String? _gender; // Male or Female
  int? _degreeOfAutism; // 1, 2, or 3

  String? _errorText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<PatientCubit, PatientState>(
        listener: (context, state) {
          state.whenOrNull(
            addPatientloading: () {
              CustomDialog(context,
                  mainButton: TextButton(
                    style: const ButtonStyle(
                      splashFactory: NoSplash.splashFactory,
                      overlayColor: MaterialStatePropertyAll(Colors.transparent),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Close",
                      style: AppTheme.bodyTextSmall
                          .copyWith(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 14.sp),
                    ),
                  ),
                  title: "Adding patient",
                  description: "Please wait...",
                  header: const CircularProgressIndicator(
                    color: Colors.white,
                  )).show();
            },
            error: (errorMessage) {
              Navigator.of(context).pop();
              CustomDialog(context,
                  mainButton: TextButton(
                    style: const ButtonStyle(
                      splashFactory: NoSplash.splashFactory,
                      overlayColor: MaterialStatePropertyAll(Colors.transparent),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Close",
                      style: AppTheme.bodyTextSmall
                          .copyWith(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 14.sp),
                    ),
                  ),
                  title: "Error",
                  description: errorMessage,
                  header: const Icon(
                    Icons.error,
                    color: Colors.white,
                    size: 25.0,
                  )).show();
            },
            addpatientloaded: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            },
          );
        },
        builder: (context, state) {
          final currentFocus = FocusScope.of(context);

          return GestureDetector(
            onTap: () {
              if (!currentFocus.hasPrimaryFocus && currentFocus.hasFocus) {
                FocusManager.instance.primaryFocus?.unfocus();
              }
            },
            child: SingleChildScrollView(
              child: AutofillGroup(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 50.h),
                          const Text("Add Patient",
                              style: TextStyle(color: Colors.black, fontSize: 38, fontWeight: FontWeight.bold)),
                          SizedBox(height: 40.h),
                          CustomFormInputField(
                            errorText: _errorText,
                            controller: _firstNameFieldController,
                            numbers: false,
                            lines: 1,
                            labelText: "First Name",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "First Name cannot be empty";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10.h),
                          // Spacer(),

                          CustomFormInputField(
                            errorText: _errorText,
                            controller: _lastNameFieldController,
                            numbers: false,
                            lines: 1,
                            labelText: "Last Name",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Last Name cannot be empty";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10.h),
                          // const Spacer(),

                          ListTile(
                            title: const Text("Male"),
                            leading: Radio<String>(
                              value: 'Male',
                              groupValue: _gender,
                              onChanged: (value) {
                                setState(() {
                                  _gender = value;
                                });
                              },
                            ),
                          ),
                          ListTile(
                            title: const Text("Female"),
                            leading: Radio<String>(
                              value: 'Female',
                              groupValue: _gender,
                              onChanged: (value) {
                                setState(() {
                                  _gender = value;
                                });
                              },
                            ),
                          ),
                          SizedBox(height: 10.h),
                          ListTile(
                            title: const Text("Select Birthday"),
                            trailing: const Icon(Icons.calendar_today),
                            onTap: () async {
                              final DateTime? picked = await showDatePicker(
                                context: context,
                                initialDate: _selectedDate ?? DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime.now(),
                              );
                              if (picked != null && picked != _selectedDate) {
                                setState(() {
                                  _selectedDate = picked;
                                });
                              }
                            },
                            subtitle: Text(_selectedDate == null
                                ? 'No date chosen'
                                : DateFormat('yyyy-MM-dd').format(_selectedDate!)),
                          ),
                          // Spacer(),
                          SizedBox(height: 10.h),

                          const Text("Degree of autism",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              )),

                          RadioListTile<int>(
                            title: const Text('1'),
                            value: 1,
                            groupValue: _degreeOfAutism,
                            onChanged: (int? value) {
                              setState(() {
                                _degreeOfAutism = value;
                              });
                            },
                          ),
                          RadioListTile<int>(
                            title: const Text('2'),
                            value: 2,
                            groupValue: _degreeOfAutism,
                            onChanged: (int? value) {
                              setState(() {
                                _degreeOfAutism = value;
                              });
                            },
                          ),
                          RadioListTile<int>(
                            title: const Text('3'),
                            value: 3,
                            groupValue: _degreeOfAutism,
                            onChanged: (int? value) {
                              setState(() {
                                _degreeOfAutism = value;
                              });
                            },
                          ),
                          SizedBox(height: 20.h),

                          MainButton(
                              text: "Add Patient",
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  if (!currentFocus.hasPrimaryFocus && currentFocus.hasFocus) {
                                    FocusManager.instance.primaryFocus?.unfocus();
                                  }
                                  final patient = PatientModel(
                                    firstName: _firstNameFieldController.text.trim(),
                                    lastName: _lastNameFieldController.text.trim(),
                                    gender: _gender!,
                                    autismDegree: _degreeOfAutism!,
                                    dateOfBirth: _selectedDate!,
                                  );

                                  context.read<PatientCubit>().addPatient(patient: patient);
                                }
                              },
                              blue: true),
                          SizedBox(height: 20.h),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
