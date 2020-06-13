import 'package:fluffyclientside/utlis/Exports.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => Cart(), child: NotifierProvider(child: MyApp())));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.white);
    return MaterialApp(
      title: 'Fluffy',
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.light(),
      home: IntroGuider(),
      //   home:MainSplashScreen(),
      // home:MainSplashScreen(),
    );
  }
}
