import 'package:car_pooling_app/firebase_options.dart';
import 'package:car_pooling_app/service/auth_service.dart';
import 'package:car_pooling_app/routes.dart';
import 'package:car_pooling_app/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  String? token = await SecureStorageService.read();
  User? user = AuthService().getCurrentUser();

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
      home: GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[200],
          primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme(
            color: Colors.grey[300],
            elevation: 0,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
            ),
          ),
          textTheme: const TextTheme(
            bodyText1: TextStyle(
              color: Colors.black,
            ),
            bodyText2: TextStyle(
              color: Colors.black,
            ),
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
