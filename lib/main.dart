import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shopzen_admin_dashboard/core/app/bloc_observer.dart';
import 'package:shopzen_admin_dashboard/core/di/di.dart';
import 'package:shopzen_admin_dashboard/core/secure_storage/secure_storage_service.dart';
import 'package:shopzen_admin_dashboard/core/shared_pref/shared_pref.dart';
import 'package:shopzen_admin_dashboard/firebase_options.dart';
import 'package:shopzen_admin_dashboard/shop_zen_admin_dashboard.dart';

import 'core/hive/hive_data_base.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  await SharedPref().instantiatePreferences();

  await HiveDataBase().init();

  await SecureStorageService().instantiateSecureStorage();

  Bloc.observer = AppBlocObserver();

  setupDependencies();
  runApp(ShopZenAdminDashboard());
}

