import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:my_app/domain/models/basic_details_model.dart';
import 'package:my_app/presentation/screens/display_details_screen.dart';
import 'package:my_app/presentation/screens/enter_details_screen.dart';
import 'package:my_app/presentation/screens/landing_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final routerDelegate = BeamerDelegate(
      locationBuilder: RoutesLocationBuilder(
        routes: {
          // Return either Widgets or BeamPages if more customization is needed
          '/': (context, state, data) => const LandingScreen(),
          '/enter-details': (context, state, data) => EnterDetailsScreen(
              data: data != null ? data as BasicDetailsModel : null),
          '/display-details': (context, state, data) =>
              DisplayDetailsScreen(data: data as BasicDetailsModel),
        },
      ),
    );

    return MaterialApp.router(
      routeInformationParser: BeamerParser(),
      routerDelegate: routerDelegate,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(surfaceTintColor: Colors.transparent),
      ),
    );
  }
}
