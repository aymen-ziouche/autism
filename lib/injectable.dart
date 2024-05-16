
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:xpert_autism/injectable.config.dart';

@InjectableInit()
Future<void> configInjections() async => GetIt.instance.init();
final locator = GetIt.I;


