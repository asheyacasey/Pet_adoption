// import 'package:flutter/material.dart';
//
// import 'src/screens/login/auth_screen.dart';
//
//
// class Wrapper extends StatelessWidget {
//   const Wrapper({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Navigator(
//         restorationScopeId: 'app',
//
//         ///Automatically sends the user to AuthScreen where it evaluates log in state
//         initialRoute: AuthScreen.route,
//         onGenerateRoute: (RouteSettings settings) {
//           ///this is a default loader screen, can be refactored for future reuse;
//           Widget child = const Scaffold(
//             body: Center(
//               child: SizedBox(
//                   width: 50, height: 50, child: CircularProgressIndicator()),
//             ),
//           );
//           switch (settings.name) {
//             case AuthScreen.route:
//               child = const AuthScreen();
//               break;
//             case HomeScreen.route:
//               child = const HomeScreen();
//           }
//           return MaterialPageRoute(builder: (context) => child);
//         });
//   }
// }