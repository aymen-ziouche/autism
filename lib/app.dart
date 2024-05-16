import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:xpert_autism/common/custom_router.dart';
import 'package:xpert_autism/features/patient/domain/usecases/add_patient_usecase.dart';
import 'package:xpert_autism/features/patient/domain/usecases/detect_emotion_usecase.dart';
import 'package:xpert_autism/features/patient/domain/usecases/get_patients_usecase.dart';
import 'package:xpert_autism/features/patient/domain/usecases/save_results_usecase.dart';
import 'package:xpert_autism/features/patient/presentation/cubit/patient_cubit.dart';
import 'package:xpert_autism/locator.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    print("Firestore instance: ${FirebaseFirestore.instance.app.name}");

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PatientCubit>(
          create: (context) => PatientCubit(
            locator.get<AddPatientUseCase>(),
            locator.get<GetPatientsUseCase>(),
            locator.get<DetectEmotionUsecase>(),
            locator.get<SaveResultsUseCase>(),
          ),
        ),
      ],
      child: Builder(
        builder: (context) {
          return ScreenUtilInit(
            designSize: const Size(360, 640),
            builder: (BuildContext context, Widget? child) {
              return GetMaterialApp(
                debugShowCheckedModeBanner: false,
                initialRoute: CustomRouter.splashScreen,
                onGenerateRoute: CustomRouter.onGenerateRoute,
                navigatorKey: navigatorKey,
              );
            },
          );
        },
      ),
    );
  }
}
