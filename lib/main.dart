import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:photo_text_app/home/home.dart';
import 'package:photo_text_app/utils/shared_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await SharedPreferencesHelper.initialize();
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyDpZI0Rawx3mgdQNWbmCXuvmALkLe4Oljk",
        authDomain: "assignment21-19f46.firebaseapp.com",
        databaseURL:
            "https://assignment21-19f46-default-rtdb.asia-southeast1.firebasedatabase.app/",
        projectId: "assignment21-19f46",
        storageBucket: "assignment21-19f46.appspot.com",
        messagingSenderId: "28781935793",
        appId: "1:28781935793:android:d2d63d082b0ea96496f690",
      ),
    );
  } catch (e) {
    if (kDebugMode) {
      print("Error initializing Firebase: $e");
    }
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: Size(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Photo Text App',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
              useMaterial3: false,
            ),
            home: Scaffold(
              body: DoubleBackToCloseApp(
                snackBar: SnackBar(
                  backgroundColor: const Color(0xffF3F5F7),
                  shape: ShapeBorder.lerp(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    const StadiumBorder(),
                    0.2,
                  )!,
                  width: 200,
                  behavior: SnackBarBehavior.floating,
                  content: Text(
                    'double tap to exit app',
                    style: TextStyle(
                      color: Colors.orange,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  duration: const Duration(seconds: 1),
                ),
                child: const Home(),
              ),
            ),
       
          );
        });
  }
}
