import 'package:car_pooling_app/firebase_options.dart';
import 'package:car_pooling_app/routes.dart';
import 'package:car_pooling_app/service/auth_service.dart';
import 'package:car_pooling_app/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:navigation_history_observer/navigation_history_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  String? token = await SecureStorageService.read();
  User? user = AuthService().getCurrentUser();
  
  easyLoadingConfig();

  runApp(MyApp(
    token: token,
    user: user,
    
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.token, this.user});

  final String? token;
  final User? user;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    cacheImagesFromAssets(context);

    bool signedIn = user != null ? true : false;
    bool tokenPresent = token != null ? true : false;

    return NeumorphicApp(
      themeMode: ThemeMode.light,
      navigatorObservers: [NavigationHistoryObserver()],
      home: GetMaterialApp(
        title: 'Flutter Demo',
        builder: EasyLoading.init(),
        themeMode: ThemeMode.light,
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.grey[200],
          appBarTheme: AppBarTheme(
            color: Colors.grey[300],
            elevation: 0,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
            ),
          ),
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Colors.black,
                displayColor: Colors.black,
              ),
        ),


        
        initialRoute: signedIn && tokenPresent
            ? '/home'
            : signedIn
                ? '/passenger/form'
                : '/login',
        getPages: getPages,
      ),
    );
  }
}
