import 'package:facebook_clone_app/features/auth/controllers/data_model_provider.dart';
import 'package:facebook_clone_app/features/auth/controllers/date_provider.dart';
import 'package:facebook_clone_app/features/auth/controllers/error_messages_provider.dart';
import 'package:facebook_clone_app/features/auth/controllers/informations_provider.dart';
import 'package:facebook_clone_app/features/auth/controllers/login_providers.dart';
import 'package:facebook_clone_app/features/home/controllers/tab_bar_index_provider.dart';
import 'package:facebook_clone_app/firebase_options.dart';
import 'package:facebook_clone_app/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setup();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DatePickerProvider()),
        ChangeNotifierProvider(create: (context) => TabSelectionModel()),
        ChangeNotifierProvider(create: (context) => InformationsProvider()),
        ChangeNotifierProvider(create: (context) => LoginInProvider()),
        ChangeNotifierProvider(create: (context) => ErrorMessagesProvider()),
        ChangeNotifierProvider(create: (context) => DataModelProvider()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: MyRouter().router,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(
                color: Colors.black), // Set the icon color to black
            backgroundColor: Colors.white,
            elevation: 0,
          ),
        ),
      ),
    );
  }
}
