import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injectable.config.dart';

GetIt getIt = GetIt.instance;
@InjectableInit()
Future<void> configureInjection(String env) async {
  GetItInjectableX(getIt).init(environment: env);
}

//buildrunner  command with pooling watcher
//flutter pub run build_runner watch --delete-conflicting-outputs